class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  end

  def show
    @user=current_user
    @enrollments=Enrollment.search(current_user.id)
  end

  def drop
    if params[:id]
      Enrollment.destroy(params[:id])
      flash[:success] = "Sucessfully Dropped!"
      redirect_to current_user
    end
  end

  def destory
  end

end
