class CreateWishlistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlist_items do |t|
      t.belongs_to :user, index: true
      t.belongs_to :manga, index: true
      t.integer :volume
      t.timestamps
    end
  end
end
