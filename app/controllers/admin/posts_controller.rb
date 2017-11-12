class Admin::PostsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @posts = Post.matching_title_or_content(params[:search])
                   .order(id: :desc)
                   .page(params[:page])
    else
      @posts = Post.all.order(id: :desc).page(params[:page])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.moderator_id = current_moderator.id
    if @post.save
      redirect_to admin_posts_url, gflash: {notice: 'Post was successfully created'}
    else
      gflash(notice: { value: 'There was a problem creating post', sticky: true, class_name: 'error'})
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_url, notice: 'Post was successfully updated'
    else
      gflash error: { value: 'There was a problem creating post', sticky: true }
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to admin_posts_url, gflash: { notice: 'Post was successfully deleted'}
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :publish, tag_ids: [])
  end
end
