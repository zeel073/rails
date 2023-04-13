# frozen_string_literal: true

class UserdetailsController < ApplicationController
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @userdetail = @user.build_userdetail
  end

  def create
    @user = User.find(params[:user_id])
    @userdetail = @user.build_userdetail(userdetail_params)
    authorize! :manage, @user
    if @userdetail.save
      redirect_to user_path(@user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def userdetail_params
    params.require(:userdetail).permit(:address, :is_married)
  end
end
