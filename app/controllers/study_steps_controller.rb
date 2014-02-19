require 'datastreams/study_metadata'
require 'datastreams/person_metadata'
require 'datastreams/orgunit_metadata'

class StudyStepsController < ApplicationController
  
  include Wicked::Wizard
  steps :etape1, :etape2, :etape3
  
   def show
    @study = Study.find(session[:study_id])
    
    @studyMetaXML = StudyMetadata.xml_template.to_xml
    @personMetaXML = PersonMetadata.xml_template.to_xml
    @orgunitMetaXML = OrgunitMetadata.xml_template.to_xml
    
    render_wizard
  end
  
  def update
    @study = Study.find(session[:study_id])
    @study.attributes = params[:study]
    render_wizard @study
  end
  
  
  
    
  
private

  #def redirect_to_finish_wizard
   # redirect_to root_url, notice: "Thank you for signing up."
  #end

  
end
