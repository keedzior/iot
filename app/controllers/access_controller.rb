class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def index
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present? 
      found_user = AdminUser.where(:username => params[:username]).first
      #found_user_n = AdminUser.select("username").where(:username => params[:username])
      #found_user_name = Admin.select("id").where(:username => found_user_n)
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user && found_user.is_active
      # TODO: mark user as logged in
      session[:user_id ] = authorized_user.id
      session[:username ] = authorized_user.username
      found_user.update(:last_login => Time.now)
      flash[:notice] = "is active '#{found_user.is_active}' "
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # TODO: mark user as logged out
     session[:user_id ] = nil
     session[:username ] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end


  private

 


end
