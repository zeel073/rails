# frozen_string_literal: true

class UsersController < ApplicationController
  # after_action :change_value, only: [:create]
  def index
    @counting = 1
    @user = User.all
    # authorize! :read, @user
  end

  def show
    @user = User.find(params[:id])
    # authorize! :read, @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    authorize! :manage, @user
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:mobile_number, :name, :surname, :gender, :image)
  end

  def change_value
    ExampleJob.set(wait_until: 1.minutes.from_now).perform_later(@user.id)
  end
end
