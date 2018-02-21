class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @school = School.find(params[:school_id])
  end

  def new
    session[:school_id] = params[:school_id]
    puts "school id is #{params[:school_id]}"
    @school = School.find_by(id: params[:school_id])
    @schools = School.all
  end

  def create
    @student = Student.new(student_params)
    @student.save
    # puts "school id is #{params[:student][:school_id]}"
    redirect_to "/schools/#{params[:student][:school_id]}"
  end

  def edit
    @student = Student.find(params[:id])
    puts "hello from update"
    puts "#{@student}"
    @school = School.find(params[:school_id])
    puts "#{@school}"
    @schools = School.all
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    @student.save
    
    redirect_to "/schools/#{params[:school_id]}/students/#{params[:id]}"
  end

  def destroy
    student = Student.find(params[:id])
    puts "delete id is #{params[:id]}"
    # note: can use form in view if using button
    student.destroy
    redirect_to "/schools/#{params[:school_id]}"
  end

  private 
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :school_id)
  end
end
