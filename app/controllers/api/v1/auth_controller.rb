class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

#COPIED CODE SENT BY ANNIE
#   def create
#     @user = User.create(user_params)
#     if @user.valid?
#       wristband = encode_token({user_id: @user.id})
#       render json: {user: UserSerializer.new(@user), token: wristband}
#     else
#       render json: {error: "Invalid username or password"}
#     end
# end

#ANNIE'S EDIT, COPIED CODE  REMODELED FOR US
# def create
#   @user = User.find_by(email_address: params[:email_address])
#   if @user && @user.authenticate(params[:password])
#   wristband = encode_token({user_id: @user.id})
#   render json: {user: UserSerializer.new(@user), token: wristband}
#   else
#   render json: {error: "Invalid username or password"}
#   end
# end

# OUR ORIGINAL CREATE METHOD
def create
  # byebug
  @user = User.find_by(email_address: user_params[:email_address])
  if @user.valid?
    @token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  else
    render json: { error: 'failed to create user' }, status: :not_acceptable
  end
end

  #ANNIE'S EDIT, CHANGING user_parms to params(line #44)
  # def create
  #   # byebug
  #   @user = User.find_by(email_address: params[:email_address])
  #   byebug
  #   if @user.valid?
  #     @token = encode_token({ user_id: @user.id })
  #     render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  #   else
  #     render json: { error: 'failed to create user' }, status: :not_acceptable
  #   end
  # end

  private

  def user_params
    params.permit(:email_address, :password)
  end
end
