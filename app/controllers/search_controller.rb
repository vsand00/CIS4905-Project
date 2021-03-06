class SearchController < ApplicationController
    include HTTParty
    
    skip_before_action :authorized, only: [:index]

    def index
        @zip_code = params[:zip_code]
        @radius = params[:radius]
        
        api_key = "2nAkj6oACd21mLOwGFuAeMg1pa6nTSdYI4qPekfM6uJgz0vPy6EnbaXNOSe0bTkD"
        url = "https://www.zipcodeapi.com/rest/#{api_key}/radius.json/#{@zip_code}/#{@radius}/miles"
        #query here
        response = HTTParty.get(url)
        @zip_codes = response["zip_codes"]
        zip_results = @zip_codes.map{|obj| obj["zip_code"]}
        @org_results = Organization.where(zipcode: zip_results)
    end
end

def find_distance(organization)
    # find org zip code within zip_codes (iterate over zip_codes)
    result_zip = @zip_codes.detect{|zip_hash| zip_hash["zip_code"] == organization.zipcode}
    # return corresponding distance found
    return result_zip["distance"]
end