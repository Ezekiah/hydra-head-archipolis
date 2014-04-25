#encoding:utf-8
require 'datastreams/agent_metadata'


require 'concerns/metadatas.rb'



class Copyright_holder < ActiveFedora::Base
  
    include Agent_metadata

  
end