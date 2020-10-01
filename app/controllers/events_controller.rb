class EventsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @event = @article.events.create(event_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @event = @article.events.find(params[:id])
        @event.destroy
        redirect_to article_path(@article)
    end
     
    private
        def event_params
          params.require(:event).permit(:title, :date, :location)
        end
end
