class PurchaseUsersController < ApplicationController


  def index
    @item = Item.find(params[:item_id])
    @purchase_user_address = PurchaseUserAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_user_address = PurchaseUserAddress.new(purchase_user_params)
    if @purchase_user_address.valid?
      pay_item
      @purchase_user_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_user_params
    params.require(:purchase_user_address).permit(:user, :item, :post_code, :area_id, :city, :block, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_user_params[:token],
      currency: 'jpy'
    )
  end
end
