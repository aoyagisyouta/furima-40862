require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入機能テスト' do
    context '購入できる場合' do
      it 'フォームに正しく入力すれば購入できる' do
        expect(@purchase).to be_valid
      end
    end
  end
end
