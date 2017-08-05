class CommentsController < ApplicationController
  def comment_content
    comment = Comment.new(comment_params)
    user = User.find(comment.post.user_id)
    if comment.save
      redirect_to user
    else
      redirect_to root_url
    end
  end

private
  def comment_params
    params.permit(:body, :post_id)
  end

end
