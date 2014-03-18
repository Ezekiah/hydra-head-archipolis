require 'datastreams/study_metadata'
require 'datastreams/person_metadata'
require 'datastreams/orgunit_metadata'
require 'datastreams/affiliation_metadata'
require 'datastreams/address_metadata'
require 'datastreams/identifier_metadata'
require 'datastreams/description_metadata'
require 'datastreams/keyword_metadata'
require 'datastreams/award_metadata'
require 'datastreams/project_metadata'
require 'datastreams/note_metadata'
require 'datastreams/metadatas.rb'

@@collection_lang = {'fr_FR'=>'fr_FR', 'en_EN'=>'en_EN', }

@@collection_partial = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'partially'=>I18n.t('partially')}

@@collection_dn = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Don\'t know'=>I18n.t('dont_know')}

@@collection_un = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Unknown'=>I18n.t('unknown')}
class StudyStepsController < ApplicationController
  
  layout 'study_steps'

  include Wicked::Wizard
  steps :contributor, :universe, :method, :corpus, :analyse, :edition, :notes
  def show
    @study = Study.find(session[:study_id])

    @most_used_languages = LanguageList::COMMON_LANGUAGES.map { |value| value.iso_639_1 == 'en' || value.iso_639_1 == 'fr' || value.iso_639_1 == 'de'? [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]:""}.reject!(&:empty?)
    @all_languages =  LanguageList::COMMON_LANGUAGES.map { |value| [ t('languages.'+value.iso_639_1.upcase), value.iso_639_1]}

    @LOCATIONS = { t('most_used') => @most_used_languages,
                   t('others') =>
                   @all_languages-@most_used_languages
    }

    render_wizard
  end

  def update

    sub_obj_non_attributes = study_params.select { |key| !key.to_s.match(/_attributes$/) }

    @study = Study.find(session[:current_study_id])

    @study.update(sub_obj_non_attributes.to_h)

    traverse_study_attr(study_params.select { |key| key.to_s.match(/_attributes$/)}, @study)

    render_wizard @study

  end

  private

  def traverse_study_attr(params, object)

    #recover all _attributes (nested forms)
    obj_attributes = params.select { |key| key.to_s.match(/_attributes$/) }

    #foreach association
    obj_attributes.each do |key,value|

    #Store model name ***_attributes

    #remove _attributes from key to get the association name
      model_property = key.to_s.gsub(/_attributes/, '')

      value.each do |k,v|

      #Check if sub associations exists
        sub_obj_attributes = v.select { |key| key.to_s.match(/_attributes$/) }
        #recover simple properties
        sub_obj_non_attributes = v.select { |key| !key.to_s.match(/_attributes$/) }

        debugger

        if !sub_obj_non_attributes.empty?

          if v.has_key?("rec_class")

            rec_class = Object.const_get(v['rec_class'])

            if v.has_key?("rec_id") && v["rec_id"]!=""

              updateObject = Object.const_get(v['rec_class']).find(v['rec_id'])

              if  v.has_key?("rec_delete") && v["rec_delete"]=="true"
                updateObject.delete()

              else

                updateObject.update(sub_obj_non_attributes.select { |key| !key.to_s.match(/_destroy$/) })

                debugger

                if !sub_obj_attributes.empty?

                  traverse_study_attr(sub_obj_attributes, updateObject)

                end

              end

            else

              newObject = rec_class.new(sub_obj_non_attributes.select { |key| !key.to_s.match(/_destroy$/) })
              object.send(model_property) << newObject

              debugger

              if !sub_obj_attributes.empty?

                traverse_study_attr(sub_obj_attributes, newObject)

              end
            end

          end

        end

      end

    end

  end

  #def redirect_to_finish_wizard
  # redirect_to root_url, notice: "Thank you for signing up."
  #end

  def study_params
    params[:study]
  end

end
