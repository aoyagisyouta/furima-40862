class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_cost, class_name: 'ShippingCost'
  belongs_to :shipping_day, class_name: 'ShippingDay'
  belongs_to :item_status, class_name: 'ItemStatus'
  belongs_to :category
  belongs_to :user
  has_one_attached :image 

  with_options presence: true do 
    validates :item_name
    validates :item_info
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
    validates :user
  end 

  with_options  numericality: { other_than: 1, message: "can't be blank" } do 
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :image, presence: true, unless: :was_attached?

  def was_attached? 
    self.image.attached? 
  end 
  
end
