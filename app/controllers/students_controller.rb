# frozen_string_literal: true

class StudentsController < ApplicationController
  # http_basic_authenticate_with name: "zeel", password: "zeel073", only: [:index, :show]
  # after_action :send_mail, only: %i[create update]
  # before_action :hello, only: [:new]
  # caches_page :index, :show, expires_in: 30.seconds
  # caches_action :new
  def index
    @students = Student.all
    @studentspaginate = Student.paginate(:page => params[:page], :per_page => 10)
    # p 11_111_111_111_116_725_378_236_594_578_934_038_659_048_483_957_489_007_934_573
    # @stud = Student.find_in_batches(batch_size: 5) do |student|
    #   p student
    #   p "zeeeellllll"
    # end
    # @stud = Student.where("id = ?", params[:id])
    # p @stud
    # @stud = Student.order(rollNo: :desc).order( :name )
    # p @stud
    # @stud = Student.select(:rollNo, :id, :name).order(:name).distinct
    # p @stud
    # @stud = Student.limit(4)
    # p @stud
    # p 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999
    # @students.each do |student|
    #   cache student.name do
    #     p student.name
    #   end
    # end
    # @rev = Review.eager_load(:student).all
    # @rev.each do |e|
    #   p e.student.name
    # end
    # result = Rails.cache.read("students/all-2023-03-10 13:12:39 UTC/index")
    # p result
    # max_updated_at = Student.find(14).updated_at
    # cache_key = "students/all-#{max_updated_at}"
    #  Rails.cache.fetch([cache_key, __method__] , expires_in: 30.minutes) do
    #    @first = Student.find(14)
    #    p 909090909099090090909090
    #    p @first
    #     end

  end

  def show
    flash[:alert] = "Product purchased successfully!"
    @student = Student.friendly.find(params[:id])
    # cache_key = students_#{params[:id]}_#{params[:updated_at]}
    # @result = Rails.cache.fetch(cache_key) do
    #   Student.count
    # end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    authorize @student
    respond_to do |format|
      if @student.save
        # redirect_to @student
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    # p 11111111111
    p params
    @student = Student.friendly.find(params[:id])
  end

  def update
    @student = Student.friendly.find(params[:id])
    authorize @student
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.friendly.find(params[:id])
    authorize @student
    @student.destroy
    redirect_to root_path, status: :see_other
  end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def create_card
    respond_to do |format|
      if current_new_user.StripeId.nil?
        customer = Stripe::Customer.create({ "email": current_new_user.email })
        # here we are creating a stripe customer with the help of the Stripe library and pass as parameter email.
        current_new_user.update(:StripeId => customer.id)
        # we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
      end

      card_token = params[:stripeToken]
      # it's the stripeToken that we added in the hidden input
      if card_token.nil?
        format.html { redirect_to student_path, error: "Oops" }
      end
      # checking if a card was giving.

      customer = Stripe::Customer.new current_new_user.StripeId
      customer.source = card_token
      # we're attaching the card to the stripe customer
      customer.save

      format.html { redirect_to success_path }
    end
  end

  def success
    @plans = Stripe::Plan.list.data
    unless current_new_user.StripeId.present?
      redirect_to root_path, :flash => { :error => 'Firstly you need to enter your card' }
      return
    end
  end

  def subscribe
    customer = Stripe::Customer.new current_new_user.StripeId
    # we define our customer
    plan_id = params[:plan_id]
    subscription = Stripe::Subscription.create({
                                                 customer: customer,
                                                 items: [{ plan: plan_id }], })
    # we are creating a new subscription with the plan_id we took from our form
    subscription.save
    redirect_to root_path
  end

  # before_action :print_after_action
  # before_action :print_before_action
  # after_action :print_after_action
  #
  # private
  # def print_before_action
  #   p "BEFORE"
  # end
  # def print_after_action
  #   p "AFTER"
  # end

  private

  def student_params
    params.require(:student).permit(:rollNo, :name, :remarks, :status, :email)
  end

  def send_mail
    StudentMailer.welcome_email(@student).deliver_now
  end

  def hello
    p 'Helllloooooooooooooo'
  end
end
