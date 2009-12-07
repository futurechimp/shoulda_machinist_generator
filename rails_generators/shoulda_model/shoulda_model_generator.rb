class ShouldaModelGenerator < Rails::Generator::NamedBase
  default_options :skip_timestamps => false, :skip_migration => false

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name, "#{class_name}Test"

      # Model, test, and fixture directories.
      m.directory File.join('app/models', class_path)
      m.directory File.join('test/unit', class_path)

      # Model class, unit test, and blueprint.
      m.template 'model.rb',      File.join('app/models', class_path, "#{file_name}.rb")
      m.template 'unit_test.rb',  File.join('test/unit', class_path, "#{file_name}_test.rb")

      unless options[:skip_migration]
        m.migration_template 'migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
        }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
      end
      
      m.template 'blueprints.rb', File.join('test', "blueprints.rb")
      m.blueprint_resources class_name
    end
  end

  def factory_line(attribute)
    "#{file_name}.#{attribute.name} '#{attribute.default}'"
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} ModelName [field:type, field:type]"
    end

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--skip-timestamps",
             "Don't add timestamps to the migration file for this model") { |v| options[:skip_timestamps] = v }
      opt.on("--skip-migration", 
             "Don't generate a migration file for this model") { |v| options[:skip_migration] = v }
      opt.on("--skip-factory",
             "Don't generation a fixture file for this model") { |v| options[:skip_factory] = v}
    end
    
    #  This inserts the routing declarations into the engine's routes file. 
    #  Copied from Rails::Generator::Commands and modified to make it do what we want.
    #
    def blueprint_resources(class_name)
      # Add the map.namespace(:admin) macro into the routes file unless it's already there.
      #
      sentinel = '# Model class blueprints'
      gsub_file File.join('test', 'blueprints.rb'), /(#{Regexp.escape(sentinel)})/mi do |match|
        "\n#{match}\n#{class_name}.blueprint do\nend"
      end
      
    end


    # It's quite crude to copy and paste this in here, but it's working for the moment.  It actually comes
    # from Rails::Generator::Commands.  This should be fixed.
    #
    def gsub_file(relative_destination, regexp, *args, &block)
      path = destination_path(relative_destination)
      content = File.read(path).gsub(regexp, *args, &block)
      File.open(path, File::RDWR|File::CREAT) { |file| file.write(content) }
    end
end
