class AddDateToSensors < ActiveRecord::Migration
  def change
  	add_column("sensors", "measurement_time", :datetime)
  end
end
