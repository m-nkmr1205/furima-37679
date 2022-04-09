class OrdersController < ApplicationController
  before_action :authenticate_user!

def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new
end

def new
end

def create
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new(order_params)
  if @order_address.valid?
     @order_address.save
     redirect_to root_path
  else
    render action: :index
  end
end


private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipulities, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_record: params[:purchase_record_id])
  end
end