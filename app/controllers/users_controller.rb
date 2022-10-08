class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :is_user?
  before_action :set_conversation, only: [:show]
    
 

  def show
    @user = User.find(params[:id])
    @user_collection = LibraryItem.where(user: current_user)
    @user_wishlist = WishlistItem.where(user: current_user)
  end

  def edit
    @user_collection = LibraryItem.where(user: current_user)
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name])
      redirect_to '/'
    end
  end


  private
  
  def is_user?
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:alert] = "action impossible !"
      redirect_to "/"
    end
  end

  def set_conversation
    @conversation = Conversation.last
  end
end
