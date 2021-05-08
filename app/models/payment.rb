class Payment < ApplicationRecord
  belongs_to :reservation

  enum state: [:not_processed, :processed, :removed]

  scope :get_user_payments, -> (user_id) { joins(:reservation).where('reservations.user_id' => user_id).where.not("state = ?", 2) }

end
