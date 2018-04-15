class StaticPagesController < ApplicationController
  def home
    redirect_to new_receipt_path if logged_in?
  end
end
