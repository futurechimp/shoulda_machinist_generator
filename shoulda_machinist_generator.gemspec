# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shoulda_machinist_generator}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Hrycyszyn", "Stuart Chinery"]
  s.date = %q{2011-02-24}
  s.description = %q{A superfork of shoulda_generator}
  s.email = %q{dave.hrycyszyn@headlondon.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "rails_generators/shoulda_machinist_admin_scaffold/shoulda_machinist_admin_scaffold_generator.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/controller.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/functional_test.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/helper.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/layout.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/view__form.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/view_edit.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/view_index.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/view_new.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/admin/view_show.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/controller.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/functional_test.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/helper.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/init.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/layout.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/routes.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/test_helper.rb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/view_index.html.erb",
    "rails_generators/shoulda_machinist_admin_scaffold/templates/view_show.html.erb",
    "rails_generators/shoulda_machinist_model/USAGE",
    "rails_generators/shoulda_machinist_model/shoulda_machinist_model_generator.rb",
    "rails_generators/shoulda_machinist_model/templates/blueprints.rb",
    "rails_generators/shoulda_machinist_model/templates/migration.rb",
    "rails_generators/shoulda_machinist_model/templates/model.rb",
    "rails_generators/shoulda_machinist_model/templates/unit_test.rb",
    "rails_generators/shoulda_machinist_scaffold/USAGE",
    "rails_generators/shoulda_machinist_scaffold/shoulda_machinist_scaffold_generator.rb",
    "rails_generators/shoulda_machinist_scaffold/templates/blueprint/ie.css",
    "rails_generators/shoulda_machinist_scaffold/templates/blueprint/print.css",
    "rails_generators/shoulda_machinist_scaffold/templates/blueprint/screen.css",
    "rails_generators/shoulda_machinist_scaffold/templates/controller.rb",
    "rails_generators/shoulda_machinist_scaffold/templates/erb/_form.html.erb",
    "rails_generators/shoulda_machinist_scaffold/templates/erb/edit.html.erb",
    "rails_generators/shoulda_machinist_scaffold/templates/erb/index.html.erb",
    "rails_generators/shoulda_machinist_scaffold/templates/erb/layout.html.erb",
    "rails_generators/shoulda_machinist_scaffold/templates/erb/new.html.erb",
    "rails_generators/shoulda_machinist_scaffold/templates/erb/show.html.erb",
    "rails_generators/shoulda_machinist_scaffold/templates/functional_test/basic.rb",
    "rails_generators/shoulda_machinist_scaffold/templates/helper.rb",
    "test/fixtures/about_yml_plugins/bad_about_yml/about.yml",
    "test/fixtures/about_yml_plugins/bad_about_yml/init.rb",
    "test/fixtures/about_yml_plugins/plugin_without_about_yml/init.rb",
    "test/fixtures/eager/zoo.rb",
    "test/fixtures/eager/zoo/reptile_house.rb",
    "test/fixtures/environment_with_constant.rb",
    "test/fixtures/lib/generators/missing_class/missing_class_generator.rb",
    "test/fixtures/lib/generators/working/working_generator.rb",
    "test/fixtures/plugins/alternate/a/generators/a_generator/a_generator.rb",
    "test/fixtures/plugins/default/gemlike/init.rb",
    "test/fixtures/plugins/default/gemlike/lib/gemlike.rb",
    "test/fixtures/plugins/default/gemlike/rails/init.rb",
    "test/fixtures/plugins/default/plugin_with_no_lib_dir/init.rb",
    "test/fixtures/plugins/default/stubby/about.yml",
    "test/fixtures/plugins/default/stubby/generators/stubby_generator/stubby_generator.rb",
    "test/fixtures/plugins/default/stubby/init.rb",
    "test/fixtures/plugins/default/stubby/lib/stubby_mixin.rb",
    "test/fixtures/tmp/test.log",
    "test/rails_generators/shoulda_model_generator_test.rb",
    "test/shoulda_macros/generator_macros.rb",
    "test/stolen_from_railties.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/futurechimp/shoulda_machinist_generator}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generators which create tests using shoulda and machinist}
  s.test_files = [
    "test/fixtures/about_yml_plugins/bad_about_yml/init.rb",
    "test/fixtures/about_yml_plugins/plugin_without_about_yml/init.rb",
    "test/fixtures/eager/zoo.rb",
    "test/fixtures/eager/zoo/reptile_house.rb",
    "test/fixtures/environment_with_constant.rb",
    "test/fixtures/lib/generators/missing_class/missing_class_generator.rb",
    "test/fixtures/lib/generators/working/working_generator.rb",
    "test/fixtures/plugins/alternate/a/generators/a_generator/a_generator.rb",
    "test/fixtures/plugins/default/gemlike/init.rb",
    "test/fixtures/plugins/default/gemlike/lib/gemlike.rb",
    "test/fixtures/plugins/default/gemlike/rails/init.rb",
    "test/fixtures/plugins/default/plugin_with_no_lib_dir/init.rb",
    "test/fixtures/plugins/default/stubby/generators/stubby_generator/stubby_generator.rb",
    "test/fixtures/plugins/default/stubby/init.rb",
    "test/fixtures/plugins/default/stubby/lib/stubby_mixin.rb",
    "test/rails_generators/shoulda_model_generator_test.rb",
    "test/shoulda_macros/generator_macros.rb",
    "test/stolen_from_railties.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

