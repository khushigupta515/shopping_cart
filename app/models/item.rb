class Item < ApplicationRecord
    belongs_to :cart
    has_one_attached :avatar
    validates :avatar, presence: true,exclusion: {in: [nil],message: "Avatar Cannot Be nil" }
    validates :price, presence: true,comparison: { greater_than: 0,message: "Price needs to be greater than zero" },exclusion: { in: [nil],message: "Price cannot Be nil" }
    validates :quantity, presence: true,comparison: { greater_than: 0,message: "Quantity needs to be greater than zero"},exclusion: { in: [nil],message: "Quantity cannot Be nil" }
    validates :title, presence: true,exclusion: { in: [nil],message: "Title cannot Be nil" }
  
end
