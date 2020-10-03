# frozen_string_literal: true
require 'rom'

module Blog
 class ArticleRepo < ROM::Repository[:articles]
   def query(conditions)
     articles.where(conditions).to_a
   end

   def by_id(id)
     articles.by_pk(id).one!
   end

   def create(article)
     articles.command(:create).call(article)
   end
 end
end
