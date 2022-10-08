class CreateLibraryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :library_items do |t|

      t.string :state
      t.text :state_description
      t.integer :token_price
      t.integer :volume
      t.belongs_to :user, index: true
      t.belongs_to :manga, index: true
      t.timestamps
    end
  end
end
