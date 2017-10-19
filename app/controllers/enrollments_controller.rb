class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  enda

  def show
    @user=current_user
  end


end
