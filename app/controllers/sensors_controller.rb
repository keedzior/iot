class SensorsController < ApplicationController
  
  layout "admin"

  def index
    @sensors = Sensor.sorted
  end

  def new
  end

  def edit

  end

  def show
    @sensors = Sensor.sorted
  end

  def delete
  end
end
