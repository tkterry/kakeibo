class TypesController < ApplicationController
  def index
    @types=current_user.type.all
  end

  def create
    @type=current_user.type.new(type_params)
    if @type.save
      flash[:success] ="科目を登録しました"
    else
      flash[:danger] ="未入力項目があります"      
    end
    redirect_to types_path
  end

  def edit
    @type=Type.find(params[:id])
  end

 def update
    @type=Type.find(params[:id])
    if @type.update(type_params)
      redirect_to types_path
      flash[:success]="Type updated"
    else
      render 'edit'
    end
 end

 def destroy
    @type=Type.find(params[:id])
    @type.destroy
    flash[:success]="Type deteted"
    redirect_to types_path
 end

private
 def type_params
    params.require(:type).permit(:title,:note,:budget)
 end
end
