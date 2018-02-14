class BlogsController < ApplicationController


  def index
    @blog=Blog.new
    @blogs=Blog.limit(12).reverse_order
  end

  def create
    if user_signed_in?
    @blog=Blog.new(params_blog)
    @blog.user_id=current_user.id
    @blog.user_name=current_user.name
    if @blog.save
        redirect_back(fallback_location: index)
    end
  else
    flash[:notice]="You must sign in first"
    redirect_to new_user_session_path
  end
  end

  private

  def params_blog
    params.require(:blog).permit(:body)
  end
end
