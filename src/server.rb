# frozen_string_literal: true

require 'roda'

# Main Roda Server Class:
# Here you can find all of the defined routes and its controllers.
class BlogApp < Roda
  route do |r|
    # HOMEPAGE
    r.on '' do
      'Homepage'
    end
    # NOT FOUND
    r.on do
      'Not Found'
    end
  end
end
