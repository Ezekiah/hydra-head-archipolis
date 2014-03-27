require 'concerns/metadatas.rb'
require 'concerns/studies_mod.rb'


@@collection_lang = {'fr_FR'=>'fr_FR', 'en_EN'=>'en_EN', }

@@collection_partial = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'partially'=>I18n.t('partially')}

@@collection_dn = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Don\'t know'=>I18n.t('dont_know')}

@@collection_un = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Unknown'=>I18n.t('unknown')}
class StudyStepsController < ApplicationController
  
  include Studies_mod
  
  
  
  
  layout 'study_steps'

  include Wicked::Wizard
  steps :contributor, :universe, :method, :corpus, :analyse, :edition, :note
  
  
  before_filter :set_cache_buster

  
  
  
  def show
    
    if !!session[:current_study_id] == false
      redirect_to(:back)
      
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
    
    if !!session[:current_study_id] == false
      redirect_to(:back)
      
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
  

  def update
    
    sub_obj_non_attributes = study_params.select { |key| !key.to_s.match(/_attributes$/) }

    @study = Study.find(session[:current_study_id])
    
    
    
    
    if ! sub_obj_non_attributes.empty?
      @study.update(sub_obj_non_attributes.to_h)
    end
    
    traverse_study_attr(study_params.select { |key| key.to_s.match(/_attributes$/)}, @study)

    render_wizard @study

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
