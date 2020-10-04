# frozen_string_literal: true

require 'rom/sql/rake_task'
require './app/persistence/config'

namespace :db do
  task :setup do
    ROM::SQL::RakeSupport.env = Blog::Persistence.init
  end
end
