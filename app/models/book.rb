class Book < ApplicationRecord
    has_many :reservations, dependent: :destroy
    validates :title, :author, :sku, :stock, :price, presence: true


  
end
