# frozen_string_literal: true

class ApplicationPolicy
  include Pundit::Authorization
  attr_reader :new_user, :student

  def initialize(new_user, student)
    @user = new_user
    @student = student
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end


end
