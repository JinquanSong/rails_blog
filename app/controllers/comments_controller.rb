class CommentsController < ApplicationController
  def create
    if visitor.save
      flash[:notice] = "Successfully created new comment"
    else
      set_visitor_sessions
    end

    redirect_to post_path(visitor.comments.first.post_id)
  end

  private

  def visitor_comments_params
    params.require(:visitor).permit(:fullname, :email, comments_attributes: [:message, :post_id])
  end

  def visitor
    @visitor ||= VisitorCommentService.new(visitor_comments_params).visitor
  end

  def set_visitor_sessions
    session[:visitor_errors] = visitor.errors.full_messages
    session[:visitor_params] = visitor_comments_params
  end
end
