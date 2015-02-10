class SubjectsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  
  def index
    @subjects = Subject.sorted #order("position ASC")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count
  end

  def create
    # Instantiate a nie object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save sicceeds, redirect to the index action
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count + 1
      render('new')
    end


  end


  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count

  end

  def update
    # find an existing object using form parameters
    @subject = Subject.find(params[:id])

    # update the object
    if @subject.update_attributes(subject_params)
      # If save sicceeds, redirect to the index action
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render('edit')
    end


  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
    #@subject.destroy
    redirect_to(:action => 'index')
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
