class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
    @order_address = OrderAddress.new
    
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid?
       pay_item
       @order_address.save
       return redirect_to root_path
    else
      render action: :index
    end
  end  
  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :order_id, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],     # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end