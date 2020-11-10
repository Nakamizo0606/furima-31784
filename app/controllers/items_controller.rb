class ItemsController < ApplicationController
  def index
    #@items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  #def create
    #@item = Prototype.new(item_params)
    #if @item.save
      #redirect_to root_path
    #else
      #render :new
    #end  
  #end



  #private

  #def item_params
    #params.require(:item).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  #end  
end
