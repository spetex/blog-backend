# frozen_string_literal: true

require 'dry/system/container'

module Blog
  class Dependencies < Dry::System::Container
    boot(:rom) do |container|
      init do
        require 'app/persistence/config'

        config = Blog::Persistence.init
        config.auto_registration(
          File.join(APP_ROOT, 'app/persistence/'),
          namespace: 'Blog::Persistence'
        )
        container.register(:rom, ROM.container(config))
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
