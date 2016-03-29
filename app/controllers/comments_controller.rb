class CommentsController < ApplicationController
    before_action :require_user, only: [:new, :destroy]
    def new
        @recipe = Recipe.find(params[:recipe])
        @comment = Comment.new
    end
    
    def create
        binding.pry
        @comment = Comment.new(comment_params)
        @comment.chef = current_user;
        if @comment.save
            flash[:success] = "Comment was successfully posted!"
            redirect_to recipes_path
        else
            render 'new'
        end
    end
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to :back
    end
    private
    def comment_params
        params.require(:comment).permit(:comment, :recipe_id, :chef_id)
    end
end
