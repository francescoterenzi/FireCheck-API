module V1
    class ControlsController < ApplicationController

        before_action :set_control, only: [:show, :update, :destroy]

        # GET /controls
        def index
            @controls = Control.all
            json_response(@controls)
        end

        # POST /controls
        def create
            @control = Control.create!(control_params)
            json_response(@control, :created)
        end

        # GET /controls/:id
        def show
            json_response(@control)
        end

        # PUT /controls/:id
        def update
            @control.update(control_params)
            head :no_content
        end
        
        # DELETE /controls/:id
        def destroy
            @control.destroy
            head :no_content
        end

        private

        def control_params
            # whitelist params
            params.permit()
        end

        def set_control
            @control = Control.find(params[:id])
        end
    end
end