# frozen_string_literal: true

# Rakefile
require 'sinatra/activerecord/rake'
require 'rake/testtask'
require 'rake/hooks'

ENV['RACK_ENV'] ||= 'development'

namespace :db do
  task :load_config do
    require './app'
  end
end

# NOT WORK
# after 'db:migrate' do
#   task('annotate').execute
# end

# task :annotate do
#   ENV['require'] = './app'
#   system 'require=./app annotate --model-dir models'
# end

task :test do
  path = ARGV[1]
  if path
    if File.directory?(path)
      test_task = Rake::TestTask.new('directory_test') do |t|
        t.warning = false
        t.test_files = Dir.glob(File.join(path, '*_test.rb'))
      end
      task('directory_test').execute
    else
      ruby path
    end
  else
    test_task = Rake::TestTask.new('alltests') do |t|
      t.warning = false
      t.test_files = Dir.glob(File.join('test', '**', '*_test.rb'))
    end
    task('alltests').execute
  end
end

task :console do
  sh 'bundle exec irb -r `pwd`/app.rb'
end

task :c do
  task('console').execute
end

task :generate do
  require './rake_template/tools'
  type = ARGV[1]
  name = ARGV[2]
  case type
  when 'm'
    render("rake_template/model.rb.erb","models/#{name}.rb",{name: name})
    render("rake_template/factory.rb.erb","test/factories/#{name}.rb",{name: name})
  when 'c'
    render("rake_template/controller.rb.erb","test/controllers/#{name}_controller.rb",{})
  end

end

task :g do
  task('generate').execute
end