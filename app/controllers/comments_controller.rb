class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    
    def create
      @organization = Organization.find(params[:organization_id])
      @comment = @organization.comments.create(comment_params)
      redirect_to article_path(@article)
    end
   
    def destroy
      @organization = Organization.find(params[:organization_id])
      @comment = @organization.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@organization)
    end
   
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
  end