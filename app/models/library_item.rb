class LibraryItem < ApplicationRecord
  belongs_to :user
  belongs_to :manga
  has_many :conversations, dependent: :destroy
end
