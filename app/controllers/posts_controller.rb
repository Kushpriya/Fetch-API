class PostsController < ApplicationController
  def index
    @posts = ApiHandler.new.fetch_posts
  rescue StandardError => e
    flash[:error] = "Failed to fetch posts: #{e.message}"
    @posts = []
  end

  def show
    @post = ApiHandler.new.fetch_post(params[:id])
  rescue StandardError => e
    flash[:error] = "Failed to fetch post: #{e.message}"
    @post = nil
  end
end
