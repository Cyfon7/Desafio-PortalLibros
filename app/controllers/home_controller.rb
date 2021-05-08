class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    #Retrieves all the books availables
    def index
        @books = Book.get_avaible_books
    end

    def show
        @book = Book.find(params[:id])
    end

    #User Reservation Methods
    #Show books reservates by the user
    def user_books
        @reservations = Reservation.get_reservations(current_user.id)
    end

    #Make a Reservation action
    def make_reservation
        @reservation = Reservation.new
    end

    #Creates an entry in the reservation table
    def reserved
        @book = Book.find(params[:book_id])
        @reservation = Reservation.new(
            user_id: current_user.id,
            book_id: params[:book_id]
            )
        if @reservation.save!
        else
        end
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

    #Creates a payment record
    def process_payment
        @reservation = Reservation.find(params[:id])
        @payment = Payment.new
    end

    #Updates the state of payment to "removed"
    def remove_payment
        @payment = Payment.find(params[:id])
        @payment.update!(state: 2)
    end
end