require 'datastreams/ressource_metadata'

class API::RessourcesController < ApplicationController
   before_action :set_ressource, only: [:show, :edit, :update, :destroy]
  
  def index
    @ressource = Ressource.find(params[:ressource])
    render:json => @ressource.as_json
  end

  
  def create
    @ressource = Ressource.new(ressource_params)

    respond_to do |format|
      if @ressource.save
        format.html { redirect_to @ressource, notice: 'Ressource was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ressource }
      else
        format.html { render action: 'new' }
        format.json { render json: @ressource.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @ressource.update(Ressource_params)
        format.html { redirect_to @ressource, notice: 'Ressource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ressource.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
   def destroy
    @ressource.destroy
    respond_to do |format|
      format.html { redirect_to studies_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ressource
      @ressource = Ressource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ressource_params
      params[:ressource]
    end
  
  
  def show
    res = Ressource.find(params[:id])
    render:json => res
  end
  
 

end
