class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def currentUserIsAdmin
    isUserOnline
    @user = currentUser


    if @user.isAdmin == false
      redirect_to root_path
    end

  end

  def currentUser

    @currentUser = User.find(session[:userid]) if session[:userid] #||=

  end
  def isUserOnline

    if currentUser.nil?
      redirect_to root_path
    end

  end


end
