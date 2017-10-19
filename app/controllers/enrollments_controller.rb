class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  enda

  def show
    @user=current_user
  end

  def drop
    if params[:id].
      Enrollment.destroy(params[:id])
      flash[:success] = "Sucessfully Dropped!"
      redirect_to current_user
    end
  end

end
