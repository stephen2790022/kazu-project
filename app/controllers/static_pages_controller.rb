class StaticPagesController < ApplicationController
  before_action :set_conversation, only: [:index]
  
  def index
    @conversation = Conversation.last
    @manga = LibraryItem.last(4)
    @user = User.last(3)
    @most_wish = WishlistItem.all.group_by(&:manga_id).values.max_by(3) {|x| x.size }
    @most_lib = LibraryItem.all.group_by(&:manga_id).values.max_by(3) {|x| x.size }
    @discovery = LibraryItem.all.sample(3)
  end

  def search  
    if params[:search].blank?  
      redirect_to(mangas_path, alert: "Champ vide!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Manga.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end   
  end  

  def libsearch  

    if params[:search].blank? 
      redirect_to(library_items_path, alert: "Champ vide!") and return 
    else  
      @libparameter = params[:search].downcase   
      @items = []
      
      LibraryItem.all.each do |item|
        if (item.manga.title).include?(params[:search])
        @items << item
          end
        end       
    end 
  end
  
  private

  def set_conversation
    @conversation = Conversation.last
  end
end
