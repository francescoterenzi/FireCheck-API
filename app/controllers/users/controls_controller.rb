class Users::ControlsController < ApplicationController

    before_action :set_user
    before_action :set_user_control, only: [:show, :update, :destroy]
  
    # GET /users/:user_id/controls
    def index
      render :json => @user.controls.to_json(
        :include => { 
          :extinguisher => {
            :include => { 
              :company => {
                :only => [:id, :name]
              }           
            },
            :only => [:id, :matricola]
          } 
        },
        :only => :id)
    end
  
    # GET /users/:user_id/controls/:id
    def show
      render :json => @control.to_json(
        :include => { 
          :extinguisher => {
            :include => { 
              :company => {
                :only => [:id, :name]
              }           
            },
            :only => [:id, :matricola]
          } 
        },
        :only => :id)
    end
  
    # DELETE /users/:user_id/controls/:id
    def destroy
      @control.destroy
      head :no_content
    end
  
    private
  
    def item_params
      params.permit(:control)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_user_control
      @control = @user.controls.find_by!(id: params[:id]) if @user
    end
  end