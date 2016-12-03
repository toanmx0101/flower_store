class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      if current_user.admin?
        redirect_to admin_url
      else
        redirect_to user
      end
    else
        flash[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
