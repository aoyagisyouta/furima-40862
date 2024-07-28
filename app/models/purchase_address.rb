c
class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :house_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    postal_code
    city
    house_numbe
    house_name
    phone_number
    purchases_id
    item_id
    user_id
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchases = Purchase.cretae(item_id:, user_id:)
    Address.create(:postal_code, :prefecture_id, :city, :house_number, :house_name, :phone_number, :purchases_id)
  end
end
