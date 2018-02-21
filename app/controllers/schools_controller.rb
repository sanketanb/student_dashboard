class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    puts "hello from new"
    if ! session[:errors]
      session[:errors] = []
    end
  end

  def create
    puts "hello from create"
    @school = School.new(school_params)
    @school.save

    if ! @school.errors.full_messages.empty?
      session[:errors] = @school.errors.full_messages
      redirect_to '/schools/new'
    else
      session[:errors] = []
      # note: this clears off the session as well 
      redirect_to '/schools/index'
    end
  end

  def show
    @individual = School.find(params[:id])
    @students = @individual.students
  end

  def edit
    # individual = School.find_by(id: params[:id])
    @individual = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    @school.save
    redirect_to '/schools/index'
  end

  def destroy
    school = School.find(params[:id])
    puts "delete id is #{params[:id]}"
    # note: can use form in view if using button
    school.destroy
    redirect_to '/schools/index'
  end

  private 
  def school_params
    params.require(:school).permit(:branch, :street, :city, :state)
    # Note: this :school refers to index.html.erb branch='school[branch]'.... NOT TO MODEL
  end

end
