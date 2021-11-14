class DecksController < ApplicationController
    before_action :find_deck, only: [:show]

  def index
    @decks = Deck.all
  end

  def show
    @structures = @deck.structures
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to deck_path(@deck)
    else
      render 'new.html.erb'
    end
  end

  def destroy
    @deck = Deck.find(list_params)
    @deck.destroy
    redirect_to decks_path
  end
  
  private
  def find_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name)
  end
end
