class HomeController < ApplicationController
    before_action :authenticate_user!

    #Retrieves all the books availables
    def index
        @books = Book.where.not(id: Reservation.get_reserved_books)
    end

    def show
        @book = Book.find(params[:id])
    end

    #Show books reservates by the user
    def user_books
        @reservations = Reservation.get_reservations(current_user.id)
    end

    #Make a Reservation action
    def make_reservation
        byebug
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
end