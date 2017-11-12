class Admin::DashboardController < Admin::ApplicationController
  def index
    @posts = Post.last(5)
    @comments = Comment.last(2)
    @visitors = Visitor.last(5)
  end
end
