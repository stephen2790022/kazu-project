class CreateJoinMangaCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :join_manga_categories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :manga, index: true
      t.timestamps
    end
  end
end
