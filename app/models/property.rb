class Property < ApplicationRecord
  validates :address, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
