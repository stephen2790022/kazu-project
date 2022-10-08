class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :library_items
  has_many :mangas, through: :library_items
  has_many :wishlist_items
  
  after_create :welcome_send
  
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
  
end
