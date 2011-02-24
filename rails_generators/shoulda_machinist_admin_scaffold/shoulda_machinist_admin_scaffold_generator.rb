#--
# ShouldaMachinistScaffoldGeneratorConfig based on rubygems code.
# Thank you Chad Fowler, Rich Kilmer, Jim Weirich and others.
#++
class ShouldaMachinistAdminScaffoldGeneratorConfig

  DEFAULT_TEMPLATING = 'erb'
  DEFAULT_FUNCTIONAL_TEST_STYLE = 'basic'

  def initialize()
    @config = load_file(config_file)

    @templating = @config[:templating] || DEFAULT_TEMPLATING
    @functional_test_style = @config[:functional_test_style] || DEFAULT_FUNCTIONAL_TEST_STYLE
  end

  attr_reader :templating, :functional_test_style

  private

  def load_file(filename)
    begin
      YAML.load(File.read(filename)) if filename and File.exist?(filename)
    rescue ArgumentError
      warn "Failed to load #{config_file_name}"
    rescue Errno::EACCES
      warn "Failed to load #{config_file_name} due to permissions problem."
    end or {}
  end

  def config_file
     File.join(find_home, '.shoulda_generator')
  end

  ##
  # Finds the user's home directory.

  def find_home
    ['HOME', 'USERPROFILE'].each do |homekey|
      return ENV[homekey] if ENV[homekey]
    end

    if ENV['HOMEDRIVE'] && ENV['HOMEPATH'] then
      return "#{ENV['HOMEDRIVE']}:#{ENV['HOMEPATH']}"
    end

    begin
      File.expand_path("~")
    rescue
      if File::ALT_SEPARATOR then
          "C:/"
      else
          "/"
      end
    end
  end
end

class ShouldaMachinistAdminScaffoldGenerator < Rails::Generator::NamedBase
  default_options :skip_timestamps => false, :skip_migration => false, :skip_layout => true

  attr_reader   :controller_name,
                :controller_class_path,
                :controller_file_path,
                :controller_class_nesting,
                :controller_class_nesting_depth,
                :controller_class_name,
                :controller_underscore_name,
                :controller_singular_name,
                :controller_plural_name
  alias_method  :controller_file_name,  :controller_underscore_name
  alias_method  :controller_table_name, :controller_plural_name

  def initialize(runtime_args, runtime_options = {})
    super

    @configuration = ShouldaMachinistAdminScaffoldGeneratorConfig.new

    @controller_name = @name.pluralize

    base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(@controller_name)
    @controller_class_name_without_nesting, @controller_underscore_name, @controller_plural_name = inflect_names(base_name)
    @controller_singular_name=base_name.singularize
    if @controller_class_nesting.empty?
      @controller_class_name = @controller_class_name_without_nesting
    else
      @controller_class_name = "#{@controller_class_nesting}::#{@controller_class_name_without_nesting}"
    end
  end

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions(controller_class_path, "#{controller_class_name}Controller", "#{controller_class_name}Helper")
      m.class_collisions(class_path, "#{class_name}")

      # Controller, helper, views, test and stylesheets directories.
      #
      # Common directories:
      #
      m.directory(File.join('app/models', class_path))
      m.directory(File.join('test/unit', class_path))
      #
      # Admin directories:
      #
      m.directory(File.join('app/controllers/admin', controller_class_path))
      m.directory(File.join('app/helpers/admin', controller_class_path))
      m.directory(File.join('app/views/admin', controller_class_path, controller_file_name))
      m.directory(File.join('app/views/layouts/admin', controller_class_path))
      m.directory(File.join('test/functional/admin', controller_class_path))
      #
      # Public directories:
      #
      m.directory(File.join('app/controllers', controller_class_path))
      m.directory(File.join('app/helpers', controller_class_path))
      m.directory(File.join('app/views', controller_class_path, controller_file_name))
      m.directory(File.join('app/views/layouts', controller_class_path))
      m.directory(File.join('test/functional', controller_class_path))

      for action in scaffold_views
        m.template(
          "view_#{action}.html.erb",
          File.join('app/views', controller_class_path, controller_file_name, "#{action}.html.erb")
        )
      end

      for action in scaffold_admin_views
        m.template(
          "admin/view_#{action}.html.erb",
          File.join('app/views/admin', controller_class_path, controller_file_name, "#{action}.html.erb")
        )
      end

      # Layout and stylesheet for public site.
      m.template('layout.html.erb', File.join('app/views/layouts', controller_class_path, "#{controller_file_name}.html.erb"))


      # Layout and stylesheet for admin site.
      m.template('admin/layout.html.erb', File.join('app/views/layouts/admin', controller_class_path, "#{controller_file_name}.html.erb"))


      # Controller for public site
      m.template(
        'controller.rb', File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      )

      # Controller for admin
      m.template(
        'admin/controller.rb', File.join('app/controllers/admin',
             controller_class_path, "#{controller_file_name}_controller.rb")
      )

      # Tests and helpers for public site
      m.template('functional_test.rb', File.join('test/functional',
         controller_class_path, "#{controller_file_name}_controller_test.rb"))

      m.template('helper.rb', File.join('app/helpers',
                controller_class_path, "#{controller_file_name}_helper.rb"))

      # Tests and helpers for admin
      m.template('admin/functional_test.rb',
        File.join('test/functional/admin', controller_class_path,
        "#{controller_file_name}_controller_test.rb"))

      m.template('admin/helper.rb', File.join('app/helpers/admin',
         controller_class_path, "#{controller_file_name}_helper.rb"))

      m.route_resources controller_file_name
      m.route_admin_resources controller_file_name

      m.dependency 'shoulda_model', [name] + @args, :collision => :skip
    end
  end

  protected
  # Override with your own usage banner.
  def banner
    "Usage: #{$0} shoulda_machinist_admin_scaffold ModelName [field:type, field:type]"
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--skip-timestamps",
           "Don't add timestamps to the migration file for this model") { |v| options[:skip_timestamps] = v }
    opt.on("--skip-migration",
           "Don't generate a migration file for this model") { |v| options[:skip_migration] = v }

   end

  def scaffold_admin_views
    %w[ index show new edit _form ]
  end

  def scaffold_views
    %w[ index show ]
  end

  def model_name
    class_name.demodulize
  end

  #  This inserts the routing declarations into the engine's routes file.
  #  Copied from Rails::Generator::Commands and modified to make it do what we want.
  #
  def route_admin_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')

   # Add the map.namespace(:admin) macro into the routes file unless it's already there.
   #
   unless exists_in_file? 'config/routes.rb', /#{Regexp.escape("map.namespace(:admin) do |admin|")}/mi
      sentinel = 'ActionController::Routing::Routes.draw do |map|'
      logger.route "inserting map.namespace(:admin)"
      unless options[:pretend]
        gsub_file File.join('config/routes.rb'), /(#{Regexp.escape(sentinel)})/mi  do |match|
          "#{match}\n  map.namespace(:admin) do |admin|\n  end\n\n  # Minuet routes go here\n"
        end
      end
    end


    # Add the map.namespace resources macro into the admin namespace
    # in the routes file.
    #
    sentinel = 'map.namespace(:admin) do |admin|'
    logger.route "map.namespace resources #{resource_list}"
    unless options[:pretend]
      gsub_file File.join('config/routes.rb'), /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n    admin.resources #{resource_list}"
      end
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

  def exists_in_file?(relative_destination, regexp)
    path = destination_path(relative_destination)
    content = File.read(path)
    !regexp.match(content).nil?
  end

end

