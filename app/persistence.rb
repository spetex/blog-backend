# frozen_string_literal: true

module Blog
  module Persistence
    module_function
    def init
      ROM.container(:sql, 'sqlite::memory') do |config|
        puts 'config rom'
        config.default.connection.create_table(:articles) do
          primary_key :id
          column :name, String, null: false
        end

        config.relation(:articles) do
          schema(infer: true)
          auto_struct true
        end
      end
    end
  end
end

# articles = UserRepo.new(rom)
# articles2 = UserRepo.new(rom)
# articles.create({ name: 'Foo' })
# print articles.query(name: 'Foo').first.name
# print articles.by_id('1').name
