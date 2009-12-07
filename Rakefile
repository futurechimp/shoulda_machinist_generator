require 'rake'
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "shoulda_machinist_generator"
    s.summary = "Generators which create tests using shoulda and machinist"
    s.email = "dave.hrycyszyn@headlondon.com"
    s.homepage = "http://github.com/futurechimp/shoulda_machinist_generator"
    s.description = "A superfork of shoulda_generator"
    s.authors = ["Dave Hrycyszyn", "Stuart Chinery"]
    s.files =  FileList["[A-Z]*", "{rails_generators,test}/**/*"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc 'Test by default'
task :default => :test

