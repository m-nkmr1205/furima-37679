class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.seve
      redirect_to root_path
    else
      render :new
    end
    
  end


private

def item_params
  params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
end



end
