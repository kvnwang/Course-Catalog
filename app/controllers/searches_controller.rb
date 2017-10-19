class SearchesController < ApplicationController
    def new
      @course = Course.new
    end


    def search
      @subject=Subject.pluck(:name)
    end


    def show
      if params[:search].present? && params[:browse].present?
          @course = Course.both(params[:search],params[:browse]).order("created_at DESC")
      elsif params[:search].present? && !params[:browse].present?
          @course = Course.search(params[:search]).order("created_at DESC")
      elsif !params[:search].present? && params[:browse].present?
        @course = Course.subject(params[:browse])
      else
        @course = Course.all.order('created_at DESC')
      end
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
