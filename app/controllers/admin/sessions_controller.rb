class Admin::SessionsController < Admin::ApplicationController
before_action :authorize, except: [:new, :create]
  layout 'login'

  def new
    redirect_to admin_dashboard_index_path if current_moderator
  end

  def create
    @moderator = Moderator.find_by(username: params[:username])

    if @moderator && @moderator.authenticate(params[:password])
      session[:current_moderator_id] = @moderator.id
      redirect_to admin_moderators_path, notice: "You have successfully signed in"
    else
      flash[:alert] = "Invalid username or password."
    end
  end

  def destroy
    session[:current_moderator_id] = nil
    redirect_to login_path, notice: 'You have successfully logged out'
  end
end
