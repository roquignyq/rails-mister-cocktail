class DosesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])

    if params[:dose][:ingredient].to_i > 0
      ingredient = Ingredient.find(params[:dose][:ingredient].to_i)
      @dose.ingredient = ingredient

      @dose.cocktail = @cocktail
      @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # redirect_to cocktail_path(@cocktail)
      render 'cocktails/show'
    end

    # if @dose.save
    #   redirect_to cocktail_path(@cocktail)
    #   else
    #   render :new
    # end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to cocktail_path(@cocktail)
  end

  private
  def dose_params
    params.require(:dose).permit(:description)
  end
end
