class StudentProgressController < ApplicationController
  def index
    @teacher = Teacher.first
  end
end
