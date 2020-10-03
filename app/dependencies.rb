# frozen_string_literal: true

require 'dry/system/container'
require 'rom'


module Blog
  class Dependencies < Dry::System::Container
    boot(:rom) do |container|
      init do
        puts 'init persistence'

        rom = ROM.container(:sql, 'sqlite::memory') do |config|
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

        container.register(:rom, rom)
      end

      start do
        puts 'start persistence'
      end

      stop do
        puts 'end persistence'
      end
    end

    boot(:repository) do |container|
      init do
        puts 'init repository'
        require 'app/repositories'
        use :rom
        container.register(:repository, ArticleRepo.new(container[:rom]))
      end
    end
  end


  Import = Dry::AutoInject(Dependencies)
end
