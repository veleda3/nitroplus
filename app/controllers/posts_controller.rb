class PostsController < ApplicationController
  def new
  end

  def post_content
    post = Post.new(post_params)
    user = User.find(params[:user_id])
    if post.save
      redirect_to user
    else
      redirect_to root_url
    end
  end
private
  def post_params
    params.permit(:content, :user_id)
  end
end
