class AddNewColumnToUser < ActiveRecord::Migration
  def up
  	
  	add_column("admin_users", "phone_number", :string, :limit => 20, :after => "username" )
    add_column("admin_users", "is_active", :boolean, :after => "phone_number")
    add_column("admin_users", "last_login", :datetime, :default => Time.now)

   	#remove_column("admin_users", "phone_number")
  	#remove_column("admin_users", "is_active") 
  	#remove_column("admin_users", "last_login")
  end

  def down
  	remove_column("admin_users", "phone_number")
  	remove_column("admin_users", "is_active") 
  	remove_column("admin_users", "last_login")
  end
end
