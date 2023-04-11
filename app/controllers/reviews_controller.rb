# frozen_string_literal: true

class ReviewsController < ApplicationController
  # http_basic_authenticate_with name: "zzz", password: "aaa", only: :destroy
  def new
    @student = Student.find(params[:student_id])
    @review = @student.reviews.new
  end

  def create
    @student = Student.find(params[:student_id])
    @review = @student.reviews.new(review_params)
    if @review.save
      redirect_to student_path(@student)
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:student_id])
    @review = Review.find(params[:id])
  end

  def update
    @student = Student.find(params[:student_id])
    @review = @student.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to student_path(@student.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    @review = @student.reviews.find(params[:id])
    @review.destroy
    redirect_to student_path(@student), status: :see_other
  end

  def preview
    @student = Student.find(params[:student_id])
    @reviewprivate = @student.reviews.privatezeel
    @reviewpublic = @student.reviews.publiczeel
    @reviewarchived = @student.reviews.archivedzeel
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :review, :status)
  end
end
