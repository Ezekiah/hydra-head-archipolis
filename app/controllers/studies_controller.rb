require 'datastreams/study_metadata'

class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  
  # GET /studies
  # GET /studies.json
  def index
    @studies = Study.all
  end

  # GET /studies/1
  # GET /studies/1.json
  def show
    
    @study = Study.find(params[:id])
    @documents = @study.documents
    @document = Document.new
    
    @study_base_collection = @study.collections

    @studyMetaXML = Study.find(params[:id]).descMetadata.to_xml
    @hash = Hash.from_xml(@studyMetaXML.gsub("\n", ""))
    
  end

  # GET /studies/new
  def new
    @study = Study.new
    #Get datastream field
    @studyMetaXML = StudyMetadata.xml_template.to_s
    
    @hash = Hash.from_xml(@studyMetaXML.gsub("\n", ""))
    


     
    
    
  end
  
  # GET /studies/1/files
  # show study file tree 
  def files
     @study = Study.find(params[:study_id])
     @documents = @study.documents 
    
  end
  
  
  
  # GET /studies/1/edit
  def edit
    @studyMetaXML = Study.find(params[:id]).descMetadata.to_xml
    @hash = Hash.from_xml(@studyMetaXML.gsub("\n", ""))
  end

  # POST /studies
  # POST /studies.json
  
  
  
  def create

    
    
    sub_obj_non_attributes = study_params.select { |key| !key.to_s.match(/_attributes$/) }
    
    
    @study = Study.create(sub_obj_non_attributes.to_h)
    
    traverse_study_attr(study_params.select { |key| key.to_s.match(/_attributes$/)}, @study)
      
      
  
    respond_to do |format|
      if @study.save
        session[:study_id] = @study.id
        
        format.html { redirect_to study_steps_path('etape1', :study_id => @study.id), notice: 'Study was successfully created.' }
        format.json { render action: 'show', status: :created, location: @study }
      else
        format.html { render action: 'new' }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studies/1
  # PATCH/PUT /studies/1.json debugger
  def update
    respond_to do |format|
      if @study.update(study_params)
        format.html { redirect_to @study, notice: 'Study was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1
  # DELETE /studies/1.json
  def destroy
    @study.destroy
    respond_to do |format|
      format.html { redirect_to studies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_params
      params[:study]
    end
    
    def traverse_study_attr(params, object)

      #recover all _attributes (nested forms)
      obj_attributes = params.select { |key| key.to_s.match(/_attributes$/) }
      
      
      
      obj_attributes.each do |key,value|
         

         #Store model name ***_attributes
         
         model_property = key.to_s.gsub(/_attributes/, '')
         
         value.each do |k,v|
           
           
           sub_obj_attributes = v.select { |key| key.to_s.match(/_attributes$/) }
           
           sub_obj_non_attributes = v.select { |key| !key.to_s.match(/_attributes$/) }
           
  

           if !sub_obj_non_attributes.empty?
             
             #debugger
             newObject = eval(v['rec_class']).new(sub_obj_non_attributes.select { |key| !key.to_s.match(/_destroy$/) })
             
             object.send(model_property) << newObject
            
             if !sub_obj_attributes.empty?
               
               traverse_study_attr(sub_obj_attributes, newObject)
               
               
             end
            
            
           end
            
          end
         
         
        
      end
      
    end
    
end
