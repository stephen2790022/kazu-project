class JoinMangaCategory < ApplicationRecord
    belongs_to :category
    belongs_to :manga
end
