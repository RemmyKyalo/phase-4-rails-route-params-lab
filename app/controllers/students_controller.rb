class StudentsController < ApplicationController

  def index
    # students = Student.all
    # render json: students
    if params[:name]
      # If the "name" parameter is present, find all students whose first or last name matches
      @students = Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    else
      # If no parameters are present, return all students
      @students = Student.all
    end
    render json: @students
  end

  def show
    single_student= Student.find(params[:id])
    render json: single_student
  end

end
