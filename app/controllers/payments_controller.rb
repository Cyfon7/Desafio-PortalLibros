class PaymentsController < ApplicationController
    before_action :set_payment, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
      
    def index
      @payments = Payment.all
    end
      
    def new
      @payment = Payment.new
    end
      
    def show
    end
      
    def edit
    end
      
    def create
      @payment = Payment.new(payment_params)
      @payment.save!
    end
      
    def update
      @payment.update!(payment_params)
    end
      
    def destroy
      @payment.destroy!
    end
      
    private
      def set_payment
        @payment = Payment.find(params[:id])
      end
      
      def payment_params
        params.require(:payment).permit(:reservation_id, :state, :total)
      end
  end
      