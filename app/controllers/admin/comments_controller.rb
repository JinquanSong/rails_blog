class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @comments = Comment.matching_fullname_or_message(params[:search]).page(params[:page])
    else
      @comments = Comment.where(status: to_boolean(params[:status])).page(params[:page])
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(status: params[:status])
      redirect_to admin_comments_path(status: redirect_status), notice: 'Successfully updated comment'
    else
      redirect_to admin_comments_path(status: redirect_status), notice: 'There was a problem updating comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to admin_comments_path, notice: 'Comment has been deleted successfully'
  end

  private

  def redirect_status
    params[:status] != 'true'
  end
end
