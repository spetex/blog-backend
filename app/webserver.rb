# frozen_string_literal: true

require 'roda'

require 'app/dependencies'

module Blog
  # Main Roda Server Class:
  # Here you can find all of the defined routes and its controllers.
  class BlogApp < Roda
    Dependencies.start(:repository)
    include Import[:repository]

    route do |r|
      # HOMEPAGE
      r.on '' do
        repository.create({ name: 'Fooooo' })
        repository.by_id(2).name
      end
      # NOT FOUND
      r.on do
        'Not Found'
      end
    end
  end
end
