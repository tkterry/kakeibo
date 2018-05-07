class ReceiptsController < ApplicationController
# before_action :logged_in_user,only: [:new,:create,:edit,:update,:index,:destroy]
# before_action :correct_user,only: [:destroy,:index,:new,:create,:edit,:update]

 def index
    @receipts=current_user.receipt.paginate(page:params[:page]) #includes(:type).all.order(created_at: :desc).limit(5)
 end

 def new
    require 'date'
    @receipts=current_user.receipt.includes(:type).all.order(created_at: :desc).limit(5)
    @types=current_user.type.rank(:row_order)
    @amounts=current_user.receipt.includes(:type).where(p_date:Date.today.beginning_of_month..Date.today.end_of_month)
    @prevamount=current_user.receipt.includes(:type).where(p_date:Date.today.prev_month.beginning_of_month..Date.today.prev_month.end_of_month)
    @today=Date.today
  end
    
 def create
    @receipt=current_user.receipt.new(receipt_params)
    if @receipt.save
      flash[:success] ="入力しました"
    else
      flash[:danger] ="未入力項目があります"      
    end
    redirect_to new_receipt_path
 end
    
 def edit
    require 'date'
    @receipt=Receipt.find(params[:id])
    @types=current_user.type.all
    @amounts=Receipt.includes(:type).where('p_date>?',Date.today-30)
 end

 def update
    @receipt=Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to new_receipt_path
      flash[:success]="1件のデータを更新しました。"
    else
      render 'edit'
    end
 end

 def destroy
    @receipt=Receipt.find(params[:id])
    @receipt.destroy
    flash[:success]="1件のデータを削除しました。"
    redirect_to new_receipt_path
 end
    
    
private
 def receipt_params
    params.require(:receipt).permit(:payment,:p_date,:type_id,:memo,:user_id)
 end

 def correct_user
    @user=User.find(params[:user])
    redirect_to(root_url) unless correct_user?(@user)
 end

end
