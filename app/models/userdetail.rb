# frozen_string_literal: true

class Userdetail < ApplicationRecord
  belongs_to :user
  # validate :check_user_detail_count, on: :new
end

# private
# def check_user_detail_count
#   if User.find(params[:id]).userdetail.present?
#     errors.add(:user, "can only have one user detail record.")
#   end
# end
