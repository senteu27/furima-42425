class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :condition_description_id, presence: true, numericality: {other_then: 1, messages: "can t be blank"}
  validates :category_id, presence: true, numericality: {other_then: 1, message: "can t be blank"}
  validates :shipping_day_id, presence: true, numericality: {other_then: 1, messages: "can t be blank"}
  validates :prefecture_id, presence: true, numericality: {other_then: 1, messages: "can t be blank"}
  validates :shipping_prise_id, presence: true, numericality: {other_then: 1, messages: "can t be blank"}

  belongs_to :user
  belongs_to :category
  belongs_to :condition_description
  belongs_to :shipping_prise
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
end
