class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    render :index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # byebug
    @recipe = Recipe.create(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, ingredients_attributes: [:name], ingredient_ids: [])
  end
end
