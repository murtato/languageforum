class ConversationsController < ApplicationController

  before_action :authorize, except: [:index, :show]
# might have to add the before_action line for Posts or Users as well

  def index
    @conversations = Conversation.where(language_id: params[:language_id])
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @conversation = Conversation.new
    @language = Language.find(params[:language_id])
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @language = Language.find(params[:language_id])
    @conversation.language = @language

    if @conversation.save
      redirect_to language_conversation_path(@language, @conversation)
    else
      render :new
    end
  end

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])

    if @conversation.update_attributes(conversation_params)
      redirect_to language_conversations_path(params[:language_id])
    else
      render :edit
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to language_conversations_path(params[:language_id])
  end

  private
  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
