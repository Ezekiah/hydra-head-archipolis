#encoding:utf-8
require 'datastreams/agent_metadata'

require 'datastreams/metadatas.rb'



class Contact < ActiveFedora::Base
  
    include Agent_metadata

  
end