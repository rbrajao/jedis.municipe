class Address < ApplicationRecord
  belongs_to :municipe

  validates :zipcode, presence: true, format: { with: /\A\d{5}-\d{3}\z/, message: "Formato correto é 12345-678" }
end
