class RecipesController < ApplicationController

    before_action :set_recipe, only: [:edit,:update,:show,:like]
    before_action :require_user, except: [:index, :show, :like]
    before_action :require_user_like, only: [:like]
    before_action :require_same_user, only: [:edit]
    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 5)
    end
    
    def show
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = current_user
        if @recipe.save
            flash[:success] = 'successfully added the recipe!'
            redirect_to recipes_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @recipe.update(recipe_params)
            flash[:success] = 'successfully updated th recipe!'
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end
    
    def like
        like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
        if like.valid?
            flash[:success] = "Your selection was successful"
            redirect_to :back
        else
            flash[:danger] = "You can like/dislike a recipe once"
            redirect_to :back
        end
    end
    
    private
    def recipe_params
        params.require(:recipe).permit(:name,:summary,:description,:picture,style_ids: [], ingredient_ids: [])
    end
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    def require_same_user
        if current_user != @recipe.chef
            flash[:warning] = "You can't update this recipe"
            redirect_to recipes_path
        end
    end
    def require_user_like
        if !logged_in?
            flash[:warning] = "You must be logged in to perform the action"
            redirect_to :back
        end
    end
end
