class Sensor < ActiveRecord::Base

	def self.values(date)
		where("date(measurement_time) = ?", date).sum(:floatValue)
	end


	scope :sorted, lambda { order("sensors.id ASC") }
end
