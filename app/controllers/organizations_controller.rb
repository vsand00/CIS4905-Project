class OrganizationsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index
        @organizations = Organization.all
      end
    
    def show
        @organization = Organization.find(params[:id])
      end
   
    def new
        @organization = Organization.new
    end
    
    def edit
        @organization = Organization.find(params[:id])
    end

    def create
        @organization = Organization.new(organization_params)
 
        if @organization.save
            redirect_to @organization
        else
          flash.now[:messages] = @organization.errors.full_messages
          render 'new'
        end
    end

    def update
        @organization = Organization.find(params[:id])
       
        if @organization.update(organization_params)
          redirect_to @organization
        else
          render 'edit'
        end
    end

    def destroy
        @organization = Organization.find(params[:id])
        @organization.destroy
       
        redirect_to organizations_path
    end
       
    private
        def Organization_params
          params.require(:organization).permit(:title, :text, :url)
        end
end
