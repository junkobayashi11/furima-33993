require 'rails_helper'

RSpec.describe StreetBuyer, type: :model do
  before do
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('/files/test_image.png')
    item.save
    user = FactoryBot.create(:user)
    @street_buyer = FactoryBot.build(:street_buyer, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の登録' do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@street_buyer).to be_valid
    end

    it '郵便番号が空では登録できないこと' do
      @street_buyer.post_code = nil
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号に-(ハイフン)がないと登録できないこと' do
      @street_buyer.post_code = '1234567'
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include('Post code Input correctly')
    end

    it '都道府県が未登録では登録できないこと' do
      @street_buyer.prefecture_id = 1
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村が空では登録できないこと' do
      @street_buyer.municipality = ''
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空では登録できないこと' do
      @street_buyer.address = ''
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では登録できないこと' do
      @street_buyer.phone_number = ''
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は11桁以下でないと登録できないこと' do
      @street_buyer.phone_number = '111111222222'
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include('Phone number is invalid')
    end

    it 'ユーザーIDが空では登録できないこと' do
      @street_buyer.user_id = nil
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("User can't be blank")
    end

    it '商品IDが空では登録できないこと' do
      @street_buyer.item_id = nil
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空では登録できないこと' do
      @street_buyer.token = nil
      @street_buyer.valid?
      expect(@street_buyer.errors.full_messages).to include("Token can't be blank")
    end
  end
end
