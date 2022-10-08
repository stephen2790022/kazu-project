class WishlistItemsController < ApplicationController
    
    before_action :authenticate_user!

    def create

        if params.key?("manga")
            @item = WishlistItem.create(user: current_user, manga_id: params[:manga_id], volume: params[:manga][:volume])
        else
            @item = WishlistItem.create(user: current_user, manga_id: params[:manga_id])
        end
        redirect_to user_path(current_user), success: "Manga ajouté à votre wishlist !"
 
    end

    def destroy 
        @item = WishlistItem.find(params[:id])
        @item.destroy
        respond_to do |format|
            format.html { redirect_to '/users/' + current_user.id.to_s, danger: "Manga supprimé de votre wishlist !" }
            format.js { }
        end 
    end   


end
