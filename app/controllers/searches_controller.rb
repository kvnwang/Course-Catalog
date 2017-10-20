class SearchesController < ApplicationController
    def new
      @course = Course.new
    end


    def search
      @subject=Subject.pluck(:name)
    end


    def show
      @course=Course.search(params[:search], params[:browse])
    end


    def enroll
      if params[:id] && params[:name]
        @enrollment = Enrollment.new()
        @enrollment.update_attribute(:user_id, current_user.id)
        @enrollment.update_attribute(:course_id, params[:id])
        @enrollment.update_attribute(:name, params[:name])
        flash[:success] = "Sucessfully Enrolled!"
        redirect_to current_user
      end
    end

    private

   # Use callbacks to share common setup or constraints between actions.
   def set_search
     @search = Search.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def search_params
     params.fetch(:search, {})
   end

end
