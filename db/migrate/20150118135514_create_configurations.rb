class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|

    	#drop_table :configurations
    	t.string "parameter_name"
    	t.string "parameter_type"
    	t.binary "binary_value"
    	t.integer "integer_value"
    	t.float   "float_value"
    	t.string   "string_value"

    	t.timestamps #null: false

    end
  end
end
