class RegistrationController < ApplicationController

	layout 'admin'	
  def index
 	#@admin_user = AdminUser.find(2)
 	@admin_user = AdminUser.new(:first_name => "Stefan")
  end

  def register
  	@admin_user = AdminUser.new({:first_name => "Default", :last_name => "Default"})

  end

  def attempt_register
	#@admin_user = AdminUser.new({:first_name => "Default", :last_name => "Default"})  	@admin_user = AdminUser.new(admin_user_params)
	#@admin_user = AdminUser.new(:first_name => "Stefan", :last_name => "kowalski")
	@admin_user = AdminUser.new(admin_user_params)
  	if @admin_user.save
  		flash[:notice] = "Registration success"
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Try again"
  		render('register')
  	end
  end

   private 

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :phone_number, :is_active, :password)
  end

end
