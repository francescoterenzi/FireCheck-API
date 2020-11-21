module V1
  class ExtinguishersController < ApplicationController

    before_action :set_extinguisher, only: [:show, :update, :destroy]

    # GET /extinguishers
    def index
      @extinguishers = Extinguisher.all
      json_response(@extinguishers)
    end

    # POST /extinguishers
    def create
      @extinguisher = Extinguisher.create!(extinguisher_params)
      json_response(@extinguisher, :created)
    end

    # GET /extinguishers/:id
    def show
      json_response(@extinguisher)
    end

    # PUT /extinguishers/:id
    def update
      @extinguisher.update(extinguisher_params)
      head :no_content
    end
    
    # DELETE /extinguishers/:id
    def destroy
      @extinguisher.destroy
      head :no_content
    end

    private

    def extinguisher_params
      # whitelist params
      params.permit(:matricola, :company_id)
    end

    def set_extinguisher
      @extinguisher = Extinguisher.find(params[:id])
    end
  end 
end

