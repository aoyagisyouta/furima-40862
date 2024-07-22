require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
  end 

  describe '商品出品機能テスト' do 
    context '出品できる場合' do 
      it '必須事項が入力されていれば出品できる' do 
        expect(@item).to be_valid
      end 
    end 
    context '出品できない場合' do 
      it '画像がないと出品できない' do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do 
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end 
      it '商品説明がないと出品できない' do 
        @item.item_info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end 
      it 'カテゴリー情報がないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end 
      it '商品状態の情報がないと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end 
      it '配送料の情報がないと出品できない' do 
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end 
      it '発送元の情報がないと出品できない' do 
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end 
      it '発送までの日数がないと出品できない' do 
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end 
      it '価格がないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it '価格が全角文字だと出品できない' do 
        @item.price = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it '価格が300未満だと出品できない' do 
        @item.price = rand(0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it '価格が9999999を超過していると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end 
    end 
  end 
end
