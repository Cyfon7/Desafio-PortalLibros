class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :payments, dependent: :destroy

  validates :user_id, :book_id, :price, presence: true

  scope :get_reservations, -> (user_id) { where("user_id = ?", user_id) }
  scope :get_reserved_books, -> { all.pluck(:book_id) }
  scope :get_book_by_id, -> (id) { find(id).book.title }
end
