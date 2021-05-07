class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :get_reservations, -> (user_id) { where("user_id = ?", user_id) }
  scope :get_reserved_books, -> { all.pluck(:book_id) }
end
