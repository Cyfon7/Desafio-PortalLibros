class Book < ApplicationRecord
    validates :title, :author, :sku, :stock, :price, presence: true
end
