class ItemsController < ApplicationController
  def index
    
  end

  def new
 
  end

private

def item_params
  params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
end



end
