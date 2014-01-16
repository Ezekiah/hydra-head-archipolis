require 'datastreams/collection_metadata'

class API::CollectionsController < ApplicationController
   before_action :set_collection, only: [:show, :edit, :update, :destroy, :html_form, :json_study_tree]
  
  
  def index
    json = '{}'
   
    
    render:json => json
  end
  
   def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @collection }
      else
        format.html { render action: 'new' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      
      if params['form_data']['collection']
        
        params['form_data']['collection'] = Collection.find(params['form_data']['collection'])
        
      end
      
      if @collection.update(params['form_data'])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render json: params }
      else
        format.html { render action: 'edit' }
        format.json { render json: params }
      end
    end
  end

  
  
  def show
    collection = Collection.find(params[:id])
    render:json => collection
  end
  
  
  def html_form
   
   
   render:text => @collection.html_form
   
  end
  
  
  def get_collection_json
    collection = Collection.find(params[:id])
    render:json => json_study_tree(collection)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params[:collection]
    end
  
    
    def json_study_tree(col)
      json={}
    
    
      collections = col.collections.each do |col|
        { :key => col.id, :title => col.name, isFolder: true ,:children=>json_study_tree(col) }
      end
      
      if col.ressources.empty? == false
        col.ressources.each do |res|
           collections << { :key => res.id, :title => res.name, :isLazy=>false, isFolder: false}
        end
      end
      
   
      collections.to_json
  
    end
    

end
