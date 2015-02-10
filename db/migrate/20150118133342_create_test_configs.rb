class CreateTestConfigs < ActiveRecord::Migration
  def up
    create_table :test_configs do |t|

    	t.string "parameter_name"
    	t.string "parameter_type"
    	t.integer "integer_value"
    	t.float "float_value"
    	t.string "string_value"

      t.timestamps null: false
    end
  end

  def down
  	drop_table :test_configs
  end
end
