require 'datastreams/ressource_metadata'

class API::RessourcesController < ApplicationController
   before_action :set_ressource, only: [:show, :edit, :update, :destroy, :html_form]
  
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
    
     if params['form_data']['collection']
        
        params['form_data']['collection'] = Collection.find(params['form_data']['collection'])
        
      end
    
    respond_to do |format|
      if @ressource.update(params['form_data'])
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
  
  def show
    res = Ressource.find(params[:id])
    render:json => res
  end
  
  
 def xml_form
   
   form = RessourceMetadata::xml_form
   
   render:xml => form
   
 end
 
 
  def html_form
   
   
   render:text => @ressource.html_form
   
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
  
  
  
 

end
