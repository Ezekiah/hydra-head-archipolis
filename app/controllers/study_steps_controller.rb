require 'concerns/metadatas.rb'
require 'concerns/studies_mod.rb'


@@collection_lang = {'fr_FR'=>'fr_FR', 'en_EN'=>'en_EN', }

@@collection_partial = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'partially'=>I18n.t('partially')}

@@collection_dn = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Don\'t know'=>I18n.t('dont_know')}

@@collection_un = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Unknown'=>I18n.t('unknown')}
class StudyStepsController < ApplicationController
  
  include Studies_mod
  
  
  before_filter :authenticate_user!,
    :only => [:show, :new, :edit, :destroy]
  
  layout 'study_steps'

  include Wicked::Wizard
  steps :contributor, :universe, :method, :corpus, :analyse, :edition, :other, :speaker
  
  
  before_filter :set_cache_buster

  
  
  
  def show
    
    if !!session[:current_study_id] == false
      redirect_to(:back, :notice=>t("You have to complete the first step before.") )
      
    else
      @study = Study.find(session[:study_id])

      @most_used_languages = LanguageList::COMMON_LANGUAGES.map { |value| value.iso_639_1 == 'en' || value.iso_639_1 == 'fr' || value.iso_639_1 == 'de'? [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]:""}.reject!(&:empty?)
      @all_languages =  LanguageList::COMMON_LANGUAGES.map { |value| [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]}
      
      @LOCATIONS = { t('most_used') => @most_used_languages,
                     t('others') =>
                     @all_languages-@most_used_languages
      }
      
      render_wizard
      
    end
    
    
  end
  
  
  def edit
    @study = Study.find(session[:current_study_id])
    
    if !current_user.email.in?@study.edit_users
      return redirect_to :back, notice: "You are not authorized to edit this study"
    end
    
    if !!session[:current_study_id] == false
      return redirect_to(:back)
      
    end

    @most_used_languages = LanguageList::COMMON_LANGUAGES.map { |value| value.iso_639_1 == 'en' || value.iso_639_1 == 'fr' || value.iso_639_1 == 'de'? [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]:""}.reject!(&:empty?)
    @all_languages =  LanguageList::COMMON_LANGUAGES.map { |value| [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]}
  
    @LOCATIONS = { t('most_used') => @most_used_languages,
                 t('others') =>
                 @all_languages-@most_used_languages
    }
  
    render_wizard
      
    
    
    
  end
  

  def update
    
    if study_params.blank?
      redirect_to :back, notice: "Please fill all fields"
    else
    
      study_params.select { |key| key.to_s.match(/_attributes$/)}
      sub_obj_non_attributes = study_params.select { |key| !key.to_s.match(/_attributes$/) }
      
      @study = Study.find(session[:current_study_id])
      
      if ! sub_obj_non_attributes.empty?
        @study.update(sub_obj_non_attributes.to_h.except('_destroy', 'id', 'rec_id', 'updated', 'rec_delete'))
      end
      
      sub_obj_attributes = study_params.select { |key| key.to_s.match(/_attributes$/)}
      
      if ! sub_obj_attributes.empty?
      
        traverse_study_attr(study_params.select { |key| key.to_s.match(/_attributes$/)}, @study)
      
      end
      
      redirect_to next_wizard_path+'/edit'
      #render_wizard @study
      
    end

  end

  

  #def redirect_to_finish_wizard
  # redirect_to root_url, notice: "Thank you for signing up."
  #end

  def study_params
    params[:study]
  end
  
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
