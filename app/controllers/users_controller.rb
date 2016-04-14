class UsersController < ApplicationController

  before_action :authorize, except: [:index, :new, :create, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :only_this_user, only: [:edit, :update, :destroy]
# might have to add the before_action line for Posts or Users as well

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:notice] = 'You have successfully signed up!'
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = 'Registration failed!'
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  # Implement Strong Params
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def only_this_user
    redirect_to languages_path, notice: "You can't edit other users' accounts!" if current_user != @user
  end

end
