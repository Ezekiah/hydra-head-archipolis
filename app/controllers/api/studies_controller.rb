require 'datastreams/study_metadata'

class API::StudiesController < ApplicationController
  def index
    json = ''
    
    @studies = Study.all
    
    @studies.each do |study|
      json += Hash.from_xml(study.descMetadata.to_xml).to_json
      
    end
    
    render:json => json
  end

end
