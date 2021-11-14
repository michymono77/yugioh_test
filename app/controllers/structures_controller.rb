class StructuresController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
    @structure = Structure.new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @structure = Structure.new(params_structure)
    @structure.deck = @deck
    if @structure.save
      redirect_to deck_path(@deck)
    else
      # render 'new.html.erb'
      render :new
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @structure = Structure.find(params[:deck_id])
    @structure.destroy
    redirect_to deck_path(@deck)
  end

    private
  def params_structure
    params.require(:structure).permit(:deck_id, :card_id)
  end

end
