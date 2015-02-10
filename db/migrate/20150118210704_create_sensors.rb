class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
	  t.string   "sensorName"		
      t.string      "sensorValue"
      #t.timestamps null: false
    end
  end
end
