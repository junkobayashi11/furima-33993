class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyer, only: [:index, :create, :set_tramsition]
  before_action :set_transition, only: [:index, :create]

  def index
    @street_buyer = StreetBuyer.new
  end

  def create
    @street_buyer = StreetBuyer.new(buyer_params)
    if @street_buyer.valid?
      pay_item
      @street_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:street_buyer).permit(:post_code, :municipality, :address, :building_name, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_transition
    redirect_to root_path if current_user.id == @buyer_street.user_id || @buyer_street.buyer.present?
  end

  def set_buyer
    @buyer_street = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @buyer_street.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end

