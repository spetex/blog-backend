# frozen_string_literal: true

require 'dry/system/container'
require 'rom'

module Blog
  class Dependencies < Dry::System::Container
    boot(:rom) do |container|
      init do
        require 'app/persistence'
        container.register(:rom, Blog::Persistence.init)
      end
    end

    boot(:repository) do |container|
      init do
        Dependencies.start(:rom)
        require 'app/repositories'
        use :rom
        container.register(:repository, ArticleRepo.new(container[:rom]))
      end
    end
  end
  Import = Dry::AutoInject(Dependencies)
end
