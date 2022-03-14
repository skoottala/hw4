class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    if session["user_id"]
      @current_user= User.find(session["user_id"])
    #puts "------------------ code before every request ------------------"
  end
end

# @current_user = User.find(session[:user_id]) if session[:user_id]