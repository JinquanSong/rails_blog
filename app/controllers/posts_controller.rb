class PostsController < ApplicationController
  after_action :clear_sessions, only: [:show]

  def index
    if params[:tag]
      @posts = Post.published
                   .filter_by_tag(params[:tag])
                   .order(id: :desc)
                   .page(params[:page])
    else
      @posts = Post.published
                 .order(id: :desc)
                 .page(params[:page])
                 .per(Setting.post_per_page)
   end
  end

  def show
    @post = Post.find(params[:id])
    @visitor_comment = visitor_comment
  end

  def archive
    @archived_posts = (1..3).to_a.map do |year|
      [ year.year.ago.year,  Post.in_year(year.year.ago) ]
    end.to_h
  end

  def current_page
    action_name == 'archive' ? 'archive' : 'posts'
  end

  private

  def clear_sessions
    [:visitor_errors, :visitor_params].each { |k| session.delete(k) }
  end

  def visitor_comment
    if session[:visitor_errors]
      VisitorCommentService.new(session[:visitor_params]).visitor
    else
      Visitor.new(comments: [Comment.new])
    end
  end
end
