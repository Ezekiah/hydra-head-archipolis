require 'concerns/metadatas.rb'
require 'concerns/studies_mod.rb'

class StudiesController < ApplicationController
  
  include Studies_mod
  
  before_action :set_study, only: [:show, :edit]
  before_action :define_languages, only: [:show, :edit, :new]
  
  before_filter :export_i18n_messages
  

  #layout:resolve_layout
  
  
 
  
  # GET /studies
  # GET /studies.json
  def index
    @studies = Study.all
  end

  # GET /studies/1
  # GET /studies/1.json
  def show
    render :layout=>"study_steps", :locals=>{:in_association=>false, :wizard_path=>study_steps_path+'/contributor'}
     
  end

  # GET /studies/new
  def new
    
    @study = Study.new
    #Get datastream field
    session[:current_study_id] = false
    
    @study_base_collection = @study.collections

    @most_used_languages = LanguageList::COMMON_LANGUAGES.map { |value| value.iso_639_1 == 'en' || value.iso_639_1 == 'fr' || value.iso_639_1 == 'de'? [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]:""}.reject!(&:empty?)
    @all_languages =  LanguageList::COMMON_LANGUAGES.map { |value| [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]}
    
    @LOCATIONS = { t('most_used') => @most_used_languages,
                   t('others') => 
                   @all_languages-@most_used_languages
    }
    render :layout => 'study_steps' 

  end
  
  # GET /studies/1/files
  # show study file tree 
  def files
     @study = Study.find(params[:study_id])
     @documents = @study.documents 
    
  end
  
  
  
  # GET /studies/1/edit
  def edit
    
  end

  # POST /studies
  # POST /studies.json
  
  
  
  def create

    
    sub_obj_non_attributes = study_params.select { |key| !key.to_s.match(/_attributes$/) }
    
    
    @study = Study.create(sub_obj_non_attributes)
    
    traverse_study_attr(study_params.select { |key| key.to_s.match(/_attributes$/)}, @study)
    
    
    session[:current_study_id] = @study.id
      
  
    respond_to do |format|
      if @study.save
        session[:study_id] = @study.id
        
        format.html { redirect_to study_steps_path}
        
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

    sub_obj_non_attributes = study_params.select { |key| !key.to_s.match(/_attributes$/) }

    @study = Study.find(session[:current_study_id])

    
    if ! sub_obj_non_attributes.empty?
      @study.update(sub_obj_non_attributes.to_h)
    end
    
    traverse_study_attr(study_params.select { |key| key.to_s.match(/_attributes$/)}, @study)
    
    respond_to do |format|
      format.html { redirect_to study_steps_path}
      format.json { render action: 'show', status: :created, location: @study }

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
      session[:current_study_id] =params[:id]
    end
    
    def define_languages
      @most_used_languages = LanguageList::COMMON_LANGUAGES.map { |value| value.iso_639_1 == 'en' || value.iso_639_1 == 'fr' || value.iso_639_1 == 'de'? [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]:""}.reject!(&:empty?)
      @all_languages =  LanguageList::COMMON_LANGUAGES.map { |value| [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]}
      
      @LOCATIONS = { t('most_used') => @most_used_languages,
                     t('others') => 
                     @all_languages-@most_used_languages
      }
    end 
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def study_params
      params[:study]
    end
    
    private

 
     def export_i18n_messages
        SimplesIdeias::I18n.export!
     end
     
     def resolve_layout
	    case action_name
	    when "new",
	      "study_steps"
	    when "index"
	      "blacklight"
	    else
	      "application"
	    end
	  end
 
    
end
