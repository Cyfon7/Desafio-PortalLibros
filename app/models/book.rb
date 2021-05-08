class Book < ApplicationRecord
    has_many :reservations, dependent: :destroy
    validates :title, :author, :sku, :stock, :price, presence: true

    scope :get_avaible_books, -> { where.not(id: Reservation.get_reserved_books) }
end
