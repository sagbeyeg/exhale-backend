class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]
  before_action :find_user, except: [:create, :index, :profile]

  def profile
    render json: {user: current_user }, status: :accepted
  end 

  def index
    @user = User.all
    render json: @user 
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    # byebug
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
  end
  
  private 
  
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :email_address)
  end
end 
