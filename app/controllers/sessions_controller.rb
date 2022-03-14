class SessionsController < ApplicationController
  def new
  end

  def create
    entered_email= params["email"]
    entered_password=params["password"]

    #checking email
    @user=User.find_by({email:entered_email})
    
    #checking password
    if @user
      if BCrypt::Password.new(@user.password) == entered_password
        session["user_id"]=@user.id #secures the user
        flash[:notice] = "Welcome, #{@user.username}."
        redirect_to "/places"
      else
        flash[:notice] = "Password is incorrect."
        redirect_to "/sessions/new"
      
      end
    else
      flash[:notice] = "Username not found"
      redirect_to "/sessions/new" #back to login page
    end

  end

  def destroy
  end
end
  