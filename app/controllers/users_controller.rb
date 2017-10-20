class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :showlogin, only: [:new]

  def new
    @user = User.new
  end

  def show
      @user = User.find(params[:id])
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end


 private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
   end


    def showlogin
      if logged_in?
        redirect_to user_path(current_user)
      end
    end

end
