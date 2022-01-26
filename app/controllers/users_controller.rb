class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]

  #Put @users in show instead of index
  # GET /users/1 or /users/1.json

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
    @user = User.new(user_params)
    if @user.save
      log_in @user
       flash[:success] = "Welcome to sample app"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
end
