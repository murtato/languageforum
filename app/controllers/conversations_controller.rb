class ConversationsController < ApplicationController

  before_action :authorize, except: [:index, :show]
# might have to add the before_action line for Posts or Users as well

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

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])
    if @conversation.update_attributes(conversation_params)
      redirect_to :conversations
    else
      render :edit
    end
  end

  private
  def bean_params
    params.require(:bean).permit(:name, :roast, :origin, :quantity)
  end

end
