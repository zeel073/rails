# frozen_string_literal: true

module Tutorial
  class LearningsController < ApplicationController
    def index
      @learning = Learning.all
    end

    def new; end
  end
end
