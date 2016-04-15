class LanguagesController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    @language.users << current_user
    if @language.save
      redirect_to :languages
    else
      render :new
    end
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])

    if @language.update_attributes(language_params)
      redirect_to :languages
    else
      render :edit
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to :languages
  end

  private
  def language_params
    params.require(:language).permit(:name)
  end

end
