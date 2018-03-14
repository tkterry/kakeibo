class ReceiptsController < ApplicationController
    def index
        @receipts=Receipt.includes(:type).all.order(created_at: :desc).limit(5)
    end

    def new
        require 'date'
        @receipts=Receipt.includes(:type).all.order(created_at: :desc).limit(5)
        @types=Type.all
        @amounts=Receipt.includes(:type).where('p_date>?',Date.today-30)
    end
    
    def create
        @receipt=Receipt.new(receipt_params)
        @receipt.save
        redirect_to new_receipt_path
    end
    
    def edit
        require 'date'
        @receipt=Receipt.find(params[:id])
        @types=Type.all
        @amounts=Receipt.includes(:type).where('p_date>?',Date.today-30)
    end

    def update
        @receipt=Receipt.find(params[:id])
        if @receipt.update(receipt_params)
            redirect_to new_receipt_path
        else
            render 'edit'
        end
    end

    def destroy
        @receipt=Receipt.find(params[:id])
        @receipt.destroy
        redirect_to new_receipt_path
    end
    
    
private
    def receipt_params
        params.require(:receipt).permit(:payment,:p_date,:type_id,:memo)
    end
end
