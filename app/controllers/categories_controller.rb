class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @mangas = @category.mangas
    @pagy, @libraries = pagy(LibraryItem.where(manga:@mangas))
  end
end
