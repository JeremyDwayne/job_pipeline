# frozen_string_literal: true

# Home page controller
class MainController < ApplicationController
  def index
    @title = "Welcome to the main page"
  end
end
