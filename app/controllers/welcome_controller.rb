class WelcomeController < ApplicationController
  def index
    render template: "welcome"
  end
end
