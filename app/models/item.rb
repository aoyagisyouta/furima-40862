class Item < ApplicationRecord
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
  validates :image, presence: true, unless: :was_attached?

  def was_attached? 
    self.image.attached? 
  end 
  
end
