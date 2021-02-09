require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.png")
  end

  describe 'ユーザー商品投稿' do
    context '商品が投稿できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では登録できない' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it '商品の状態が空では登録できない' do
        @item.state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State Select")
      end

      it '発送料負担が空では登録できない' do
        @item.shipping_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end

      it '発送元の地域が空では登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end

      it '発送までの日数が空では登録できない' do
        @item.date_shipment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Date shipment Select")
      end

      it '販売価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は半角でなければ登録できない' do
        @item.price = ３３３３
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格は¥300~¥9,999,999の間でなければ登録できない' do
        @item.price = 30
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
    end
  end
end
