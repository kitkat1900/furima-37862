class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_method
  belongs_to :ships_from
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_method_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ships_from_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than:10000000, message: 'には半角数字で¥300~¥9,999,999の間で入力してください'}
  validates :image, presence: true
end