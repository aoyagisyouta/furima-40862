class PurchasesController < ApplicationController
<<<<<<< HEAD
  before_action :set_item, only:[:index,:create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
=======
  def index
>>>>>>> d31ad30df2a9ca5b3e8e10d7d46b3c6b4ee87864
    @purchase_address = PurchaseAddress.new
  end

  def create
<<<<<<< HEAD
    @purchase_address = PurchaseAddress.new(purchases_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchases_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :house_name, :phone_number)
    .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end 

  def pay_item 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end

=======
  end
>>>>>>> d31ad30df2a9ca5b3e8e10d7d46b3c6b4ee87864
end
