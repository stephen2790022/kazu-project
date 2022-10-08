class Category < ApplicationRecord
    has_many :join_manga_categories
    has_many :mangas, through: :join_manga_categories
end
