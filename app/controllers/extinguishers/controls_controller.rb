class Extinguishers::ControlsController < ApplicationController

    before_action :set_extinguisher, only: [:create]
    
    # GET /extinguishers/:extinguisher_id/controls
    def index
        @controls = Extinguisher.find(params[:extinguisher_id]).controls
        json_response(@controls)
    end

    private

    def control_params
        params.permit()
    end

    def set_extinguisher
        @extinguisher = Extinguisher.find(params[:extinguisher_id])
    end

end