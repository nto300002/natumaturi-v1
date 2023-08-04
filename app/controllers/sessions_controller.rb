class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]

  def new; end

  def create
    @user = login(params[:email],params[:password])
    if @user
      redirect_to flyers_path, notice: 'Logged in.'
    else
      flash.now.alert = 'Email or password was invalid.'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out.', status: :see_other
  end
end
