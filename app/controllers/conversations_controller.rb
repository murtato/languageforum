class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation.params)

    if @conversation.save
      redirect_to :conversations
    else
      render :new
    end
  end

  def update
    @conversation = Conversation.find(params[:id])

    if @conversation.update_attributes(conversation_params)
      redirect_to :conversations
    else
      render :edit
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path
  end

  private
  def bean_params
    params.require(:bean).permit(:name, :roast, :origin, :quantity)
  end

end
