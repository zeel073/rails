# frozen_string_literal: true

class NewJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
