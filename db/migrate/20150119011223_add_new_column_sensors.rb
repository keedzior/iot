class AddNewColumnSensors < ActiveRecord::Migration
  def change
  	add_column "sensors", "floatValue", :float
  end
end
