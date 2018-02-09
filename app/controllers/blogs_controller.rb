class BlogsController < ApplicationController


  def index
    @blog=Blog.new
    @blogs=Blog.limit(12).reverse_order
  end

  def create
    @blog=Blog.new(params_blog)
    if @blog.save
        redirect_back(fallback_location: index)
    end
  end

  private

  def params_blog
    params.require(:blog).permit(:body)
  end
end
