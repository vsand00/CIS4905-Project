class SearchController < ApplicationController
    include HTTParty
    
    skip_before_action :authorized, only: [:index]

    def index
        @zip_code = params[:zip_code]
        @radius = params[:radius]
        
        api_key = "0FfCUmBelcVouvrqV46NorrY4uiJYspVENWfBt28rh82dhaGhr8t5o4APLDR2xEX"
        url = "https://www.zipcodeapi.com/rest/#{api_key}/radius.json/#{@zip_code}/#{@radius}/miles"
        #query here
        response = HTTParty.get(url)
        zip_codes = response["zip_codes"]
        zip_results = zip_codes.map{|obj| obj["zip_code"]}
        @org_results = Organization.where(zipcode: zip_results)             
    end
end
