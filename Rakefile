# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

module Mastermind
  class Application
    include Rake::DSL
  end
end

module ::RakeFileUtils
  extend Rake::FileUtilsExt
end

Mastermind::Application.load_tasks
