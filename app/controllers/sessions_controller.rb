class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    @user = User.find_by({"email" => params["email"]})
    # 1. try to find the user by their unique identifier
    if @user != nil 
    # 2. if the user exists -> check if they know their password
    # user password == params["password"]
    # 3. if they know their password -> login is successful
    if BCrypt::Password.new(@user["password"]) == params["password"]
      # add cookie with the user id
      # cookies["zebra"] = "giraffe"
      session["user_id"] = @user["id"]
      flash["notice"] = "Welcome."
      redirect_to "/companies"
    else
    # 4. if the user doesn't exist or they don't know their password -> login fails
      flash["notice"] = "Nil"
      redirect_to "/login" 
    end 
  else #user is nil
    flash["notice"] = "Nil"
    redirect_to "/login"
    end 
  end

  def destroy
    # logout the user
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end