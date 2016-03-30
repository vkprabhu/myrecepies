class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update]
    before_action :require_user, only: [:new, :destroy]
    def new
        @recipe = Recipe.find(params[:recipe])
        @comment = Comment.new
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.chef = current_user;
        if @comment.save
            flash[:success] = "Comment was successfully posted!"
            redirect_to recipes_path
        else
            render 'new'
        end
    end
    
    def edit
        @recipe = Recipe.find(params[:recipe])
    end
    
    def update
        if @comment.update(comment_params)
            flash[:success] = "Successfully upated the comment!"
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
    def set_comment
        @comment = Comment.find(params[:id])
    end
    def comment_params
        params.require(:comment).permit(:comment, :recipe_id, :chef_id)
    end
end
