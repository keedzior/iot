class DemoController < ApplicationController
	layout 'application'
  def index
  	# render('hello') 
  end

  def hello
  		@array = [1,2,3,4,5]
  		@id = params['id'].to_i
  		@page = params[:page].to_i
  		@name = params[:name]
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end
  def google
  	redirect_to("http://google.com")
  end

  def text_helpers
  end
end
