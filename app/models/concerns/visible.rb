# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern
  VALID_STATUSES = %w[public private archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      a = where(status: nil).count
      b = where(status: 'public').count
      c = where(status: 'private').count
      a + b + c
    end

    def hello_method_concern
      'hello jose'
    end
  end

  def archived?
    status == 'archived'
  end
end
