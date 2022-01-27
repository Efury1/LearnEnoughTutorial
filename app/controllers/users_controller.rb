class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]

  #Put @users in show instead of index
  # GET /users/1 or /users/1.json
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    # @user = User.find(params[:id])
    @user = User.new
  end

  # POST /users or /users.json
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      log_in user
      redirect_to forwarding_url || user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def logged_in_user
     unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end
   # Confirms the correct user
   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_user) unless current_user?(@user)
   end
end
