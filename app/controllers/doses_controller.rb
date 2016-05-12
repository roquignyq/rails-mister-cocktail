class DosesController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @dose = Dose.new(dose_params)
    ingredient = Ingredient.find(params[:dose][:ingredient].to_i)
    @dose.ingredient = ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    # @review = @restaurant.review.build(review_params)

    @dose.save

    redirect_to cocktail_path(@cocktail)
    # if @dose.save
    #   redirect_to cocktail_path(@cocktail)
    #   else
    #   render :new
    # end
  end

  def destroy
  end

  private
  def dose_params
    params.require(:dose).permit(:description)
  end
end
