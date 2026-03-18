class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
  validates :name
  validates :description
  validates :image
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :condition_description_id, numericality: {other_than: 1, message: "can t be blank"}
  validates :category_id, numericality: {other_than: 1, message: "can t be blank"}
  validates :shipping_day_id, numericality: {other_than: 1, message: "can t be blank"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can t be blank"}
  validates :shipping_prise_id, numericality: {other_than: 1, message: "can t be blank"}
  end

  belongs_to :user
  belongs_to :category
  belongs_to :condition_description
  belongs_to :shipping_prise
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
end
