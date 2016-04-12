class PostsController < ApplicationController
  def create
    @post = Post.new(params.require(:post).permit(:conversation_id))

    if @post.save
      redirect_to conversation_path(@post.conversation)
    else
      render :new
    end
  end



end
