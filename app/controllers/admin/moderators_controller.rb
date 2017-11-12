class Admin::ModeratorsController < Admin::ApplicationController
  def index
    @moderators = Moderator.all
  end

  def edit
    @moderator = Moderator.find(params[:id])
  end

  def update
    @moderator = Moderator.find(params[:id])
    if @moderator.update(moderator_params)
      flash[:notice] = "moderator was successfully updated"
      redirect_to admin_moderators_path
    else
      flash[:alert] = "Ther was a problem updating moderator"
      render 'edit'
    end
  end

  private

  def moderator_params
    params.require(:moderator).permit(:fullname, :username, :password_digest)
  end

end