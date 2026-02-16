class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :condition_description_id, presence: true
  validates :category_id, presence: true
  validates :shipping_day_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_prise_id, presence: true

  belongs_to :user
end
