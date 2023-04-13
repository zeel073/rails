class StudentPolicy < ApplicationPolicy
  attr_reader :current_new_user, :student

  def initialize(current_new_user, student)
    @current_new_user = current_new_user
    @student = student
  end

  def index?
    current_new_user.admin?
  end
  def show?
    current_new_user.admin?
  end
  def new?
    create?
  end

  def create?
    current_new_user.admin?
  end

  def edit?
    update?
  end

  def update?
    current_new_user.admin?
  end

  def destroy?
    current_new_user.admin?
  end

end