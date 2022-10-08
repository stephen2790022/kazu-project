class Manga < ApplicationRecord
  has_many :library_items
  has_many :users, through: :library_items
  has_many :wishlist_items
  has_many :join_manga_categories
  has_many :categories, through: :join_manga_categories

  has_one_attached :cover

  #cette methode prend un nombre en parametre (7), et renvoie une array de tout les nombres ([1, 2, 3, 4, 5, 6, 7])
  def integer_to_array(volumes)
    all_volumes = []
    (1..volumes).each do |volume|
      all_volumes << volume
    end
    return all_volumes
  end
end
