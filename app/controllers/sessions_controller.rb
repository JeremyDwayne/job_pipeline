class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_by(session_params)
      login user
      redirect_to root_path, notice: "You have successfully logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    logout current_user
    redirect_to root_path, notice: "You have successfully logged out!"
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
