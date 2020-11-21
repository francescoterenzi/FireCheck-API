module V1
    class Extinguishers::ControlsController < ApplicationController

        before_action :set_extinguisher, only: [:create]
        
        # GET /extinguishers/:extinguisher_id/controls
        def index
            @controls = Extinguisher.find(params[:extinguisher_id]).controls
            json_response(@controls)
        end

        # POST /extinguishers/:extinguisher_id/controls
        def create
            @control = @extinguisher.controls.create()
            json_response(@control, :created)
        end

        private

        def control_params
            params.permit()
        end

        def set_extinguisher
            @extinguisher = Extinguisher.find(params[:extinguisher_id])
        end

    end
end