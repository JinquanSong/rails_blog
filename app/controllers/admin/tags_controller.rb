class Admin::TagsController < Admin::ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end

    redirect_to new_admin_tag_url, notice: 'Tags were successfully created.'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tags_params)
      redirect_to new_admin_tag_url, notice: 'Siccessfully updtaed tag'
    else
      flash[:alert] = 'There was a problem updating tag'
      render :edit
    end
  end

  def show
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to admin_tags_url, notice: 'Tag was successfully deleted'
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end
end
