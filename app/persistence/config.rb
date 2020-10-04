# frozen_string_literal: true

require 'rom'

module Blog
  module Persistence
    module_function

    def init
      ROM::Configuration.new(
        :sql,
        'postgres://127.0.0.1:5432/mydb',
        username: 'dbuser',
        password: 'dbpass'
      )
    end
  end
end
