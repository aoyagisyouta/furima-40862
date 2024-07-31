require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  context '購入できる場合' do
    it 'フォームに正しく入力すれば購入できる' do
      expect(@purchase_address).to be_valid
    end
    it '建物名が空欄でも購入できる' do
      @purchase_address.house_name = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '購入できない場合' do
    it '郵便番号がないと購入できない' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号に４桁目にハイフンが必須' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '郵便番号は半角数字でなければならない' do
      @purchase_address.postal_code = '１２３－４５６７'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県が必須' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が必須' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が必須' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が必須' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は10桁以上でなければならない' do
      @purchase_address.phone_number = '090123'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は11桁以下でなければならない' do
      @purchase_address.phone_number = '090123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は半角数字のみでなければならない' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は全角数字では購入できない' do
      @purchase_address.phone_number = '０９０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'トークンが必須' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていないと購入できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it'itemが紐づいてないと購入できない' do 
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
