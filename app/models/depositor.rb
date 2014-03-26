#encoding:utf-8
require 'datastreams/agent_metadata'


require 'concerns/metadatas.rb'


  


class Depositor < ActiveFedora::Base
  
    include Agent_metadata

  
end