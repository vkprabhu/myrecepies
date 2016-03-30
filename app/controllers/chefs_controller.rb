class ChefsController < ApplicationController
    before_action :set_chef, only: [:edit, :update, :show]
   #before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit]
    
    def index
        @chefs = Chef.paginate(page: params[:page], per_page: 2)
    end
    
    def new
        @chef = Chef.new
    end
    
    def create
        @chef = Chef.new(chef_params)
        if @chef.save
            flash[:success] = "You have been successfully registered!"
            #session[:chef] = @chef 
            redirect_to chefs_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @chef.update(chef_params)
            flash[:success] = "Successfully updated the profile"
            redirect_to chef_path(@chef)
        else
            render 'edit'
        end
    end
    
    def show
        
        @recipes = @chef.recipes.paginate(page: params[:page], per_page: 2)
    end
    
    private
    def chef_params
        params.require(:chef).permit(:chefname, :email, :password)
    end
    
    def require_same_user
        if current_user != @chef
            flash[:warning] = "You can edit only your profile"
            redirect_to root_path
        end
    end
    
    def set_chef
        @chef = Chef.find(params[:id])
    end
end
