class Companies::ExtinguishersController < ApplicationController

    # GET /companies/:company_id/extinguishers
    def index
        @extinguishers = Company.find(params[:company_id]).extinguishers
        json_response(@extinguishers)
    end

end