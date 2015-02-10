class AdminUsersController < ApplicationController
  
  layout 'admin'

  def index
    @admin_users = AdminUser.sorted
  end

  def show
    @admin_user = AdminUser.find(params[:id])
  end

  def new
    @admin_user = AdminUser.new({:first_name => "Default", :last_name => "Default"})
    #@admin_user = 
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = "User created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])

  end

  def update
    @admin_user = AdminUser.find(params[:id])

    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "User updated successfully" 
      redirect_to(:action => 'show', :id => @admin_user.id)   
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    admin_user = AdminUser.find(params[:id]).destroy

    flash[:notice] = "User '#{admin_user.username} destroyed successfully}"
    redirect_to(:action => 'index')
  end


  private 

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :phone_number, :is_active, :password)
  end
end

