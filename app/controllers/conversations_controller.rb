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
    @conversation = Conversation.new(params.require(:conversation).permit(:content, :time))

    if @conversation.save
      redirect_to conversations_path
    else
      render :new
    end
  end

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])

    if @conversation.update_attributes(params.require(:conversation).permit(:content, :time))
      redirect_to conversations_path
    else
      render :edit
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path
  end

end
