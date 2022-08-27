class ShippingAddress < ApplicationRecord
  belongs_to :order

  validates :portal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}, presence: true
  validates :description, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end