class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  #Retrieves all the books availables
  def index
    @books = Book.get_avaible_books
  end

  #User Reservation Methods
  #Show books reservates by the user
  def user_books
    @reservations = Reservation.get_reservations(current_user.id)
  end

  #Make a Reservation action
  def make_reservation
    #@reservation = Reservation.new
  end

  #Creates an entry in the reservation table
  def reserved
    @book = Book.find(params[:book_id])
    @reservation = Reservation.new(
      user_id: current_user.id,
      book_id: @book.id,
      price: @book.price
    )
    @reservation.save!
  end

  #Destroy an entry in the reservation table
  def remove_reservation
    @reservation = Reservation.find(params[:id])
    @reservation.destroy!
  end

  #Payment Methods
  #Show payments not erased 
  def user_payments
    @payments = Payment.get_user_payments(current_user.id)
  end

  #Makes a payment action
  def process_payment
    @reservation = Reservation.find(params[:id])
  end

  #Creates an entry in the payment table
  def payment_completed
    @payment = Payment.new(
      reservation_id: params[:reservation_id],
      state: params[:state],
      total: params[:total]
    )
    @payment.save!
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.update!(paid: true)
  end

  #Updates the state of payment to "removed"
  def remove_payment
    @payment = Payment.find(params[:id])
    @payment.update!(state: 2)
  end
end