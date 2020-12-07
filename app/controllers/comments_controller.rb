class CommentsController < ApplicationController 
    
  skip_before_action :authorized, only: [:create]

    def create
      @organization = Organization.find(params[:organization_id])
      @comment = @organization.comments.create(comment_params)
      redirect_to organization_path(@organization)
    end
   
    def destroy
      @organization = Organization.find(params[:organization_id])
      @comment = @organization.comments.find(params[:id])
      @comment.destroy
      redirect_to organization_path(@organization)
    end
   
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
  end