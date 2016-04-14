class PostsController < ApplicationController

before_action :authorize, except: [:index, :show]
# Might have to consider more authorized actions

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @language = Language.find(params[:language_id])
    @conversation = Conversation.find(params[:conversation_id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @conversation = Conversation.find(params[:conversation_id])
    @post.conversation = @conversation

# why conversation_id? why not post_id?
    if @post.save
      redirect_to language_conversation_path(@conversation.language, @conversation)
    else
      render :new
    end
  end
# Did one of the TA's instruct on this redirect_to logic?
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
