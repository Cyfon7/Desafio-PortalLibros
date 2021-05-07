class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @books = Book.where.not(id: Reservation.get_reserved_books)
    end

    def show
        @book = Book.find(params[:id])
    end

    def user_books
        @reservations = Reservation.get_reservations(current_user.id)
    end

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

    def remove_reservation
        @reservation = Reservation.find(params[:id])
        @reservation.destroy!
    end
end