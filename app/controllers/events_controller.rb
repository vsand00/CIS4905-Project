class EventsController < ApplicationController
    def create
        @organization = Organization.find(params[:organization_id])
        @event = @organization.events.create(event_params)
        redirect_to organization_path(@organization)
    end

    def destroy
        @organization = Organization.find(params[:organization_id])
        @event = @organization.events.find(params[:id])
        @event.destroy
        redirect_to organization_path(@organization)
    end
     
    private
        def event_params
          params.require(:event).permit(:title, :date, :location)
        end
end
