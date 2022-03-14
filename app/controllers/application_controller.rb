class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    # @current_user = User.find(session[:user_id]) if session[:user_id]
    if session["user_id"]
      @current_user= User.find(session["user_id"])
    end
    #puts "------------------ code before every request ------------------"
  end
end

