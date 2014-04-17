#encoding:utf-8

require 'datastreams/study_metadata'
require 'datastreams/tree_metadata'




class Study < ActiveFedora::Base
  

  include Hydra::AccessControls::Permissions
  
  #attr_reader :title
  
  has_metadata 'descMetadata', type:StudyMetadata
  has_metadata 'utilsMetadata', type:TreeMetadata
  
  
  
  #validates :title,  :presence => true
  
  has_attributes :contacts_description, datastream: 'descMetadata', multiple: false
  
  has_attributes :softwares, datastream: 'descMetadata', multiple: true
  
  has_attributes :edition_first_date, datastream: 'descMetadata', multiple: false
  has_attributes :edition_last_date, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :title, datastream: 'descMetadata', multiple: false
  
  #obsolete
  has_attributes :name, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :documents_count, datastream: 'descMetadata', multiple: false
  
  has_attributes :access_conditions, datastream: 'descMetadata', multiple: true
  
  
  has_attributes :contacts, datastream: 'descMetadata', multiple: true
 
  has_attributes :publications, datastream: 'descMetadata', multiple: true

  
 
  
  has_attributes :disciplines, datastream: 'descMetadata', multiple: true
  
  
  has_attributes :classifications, datastream: 'descMetadata', multiple: true
  has_attributes :observation_units, datastream: 'descMetadata', multiple: true
  
  has_attributes :documents_types, datastream: 'descMetadata', multiple: true
  
  
  
  has_attributes :coverage_spatial_geographics, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_spatial_units, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_spatial_countries, datastream: 'descMetadata', multiple: true
  has_attributes :coverage_temporal_begin, datastream: 'descMetadata', multiple: false
  has_attributes :coverage_temporal_end, datastream: 'descMetadata', multiple: false
  has_attributes :target_groups, datastream: 'descMetadata', multiple: true
  has_attributes :location_of_units_of_observations, datastream: 'descMetadata', multiple: true
  
  
  


  has_attributes :documents_date_begin, datastream: 'descMetadata', multiple: false
  has_attributes :documents_date_end, datastream: 'descMetadata', multiple: false

  has_attributes :documents_transc_count, datastream: 'descMetadata', multiple: false
  has_attributes :interviewers, datastream: 'descMetadata', multiple: true
  
  has_attributes :notes, datastream: 'descMetadata', multiple: true
  has_attributes :tree, datastream: 'utilsMetadata', multiple: false
  
  
  
  #METHOD
  has_attributes :data_collection_modes, datastream: 'descMetadata', multiple: true, type:'checkbox'
  has_attributes :data_collection_context, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_methods, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_samplings, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_time_dimensions, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_extent, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_has_media, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_documents_types, datastream: 'descMetadata', multiple: true
  has_attributes :data_collection_date_begin, datastream: 'descMetadata', multiple: false
  has_attributes :data_collection_date_end, datastream: 'descMetadata', multiple: false
  
  
  
  #CORPUS
  has_attributes :archive_extent, datastream: 'descMetadata', multiple: false
  has_attributes :archive_location, datastream: 'descMetadata', multiple: false
  has_attributes :archive_completeness, datastream: 'descMetadata', multiple: false
  has_attributes :archive_arrangement_level, datastream: 'descMetadata', multiple: false
  has_attributes :archive_consentement, datastream: 'descMetadata', multiple: false
  has_attributes :archive_agreement, datastream: 'descMetadata', multiple: false
  has_attributes :archive_accessed, datastream: 'descMetadata', multiple: false 
  has_attributes :archive_arrangement_level_description, datastream: 'descMetadata', multiple: false 
  has_attributes :archive_preservation_level, datastream: 'descMetadata', multiple: false 
  has_attributes :archive_preservation_level_description, datastream: 'descMetadata', multiple: false
  
  
  
  #ANALYSE
  has_attributes :analysis_transcription, datastream: 'descMetadata', multiple: false
  has_attributes :analysis_has_transcription, datastream: 'descMetadata', multiple: false
  has_attributes :data_languages, datastream: 'descMetadata', multiple: true
  has_attributes :documentation_languages, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_types, datastream: 'descMetadata', multiple: true
  has_attributes :analysis_anonymization, datastream: 'descMetadata', multiple: false
  has_attributes :publication_citation, datastream: 'descMetadata', multiple: true
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false 
  
  
  
  has_many :collections, :property => :is_part_of
  
  has_many :ressources, :property => :is_part_of, :through=> :collections
  
  
  has_many :depositors, :property => :is_part_of, :class_name=>"Depositor"
  
  has_many :interviewers, :property => :is_part_of, :class_name=>"Interviewer"
  
  has_many :copyright_holders, :property => :is_part_of, :class_name=>"Copyright_holder"
  
  has_many :authors, :property => :is_part_of, :class_name=>"Author"
  
  has_many :distributors, :property => :is_part_of, :class_name=>"Distributor"
 
  has_many :editors, :property => :is_part_of, :class_name=>"Editor"
  
  has_many :contacts, :property => :is_part_of, :class_name=>"Contact"
  
  has_many :interviewers_unknowns, :property => :is_part_of, :class_name=>"Interviewerun"
  
 
  has_many :affiliations, :class_name => 'Affiliation', :property => :is_part_of
  
  has_many :descriptions, :class_name => 'Description', :property => :is_part_of
  
  has_many :keywords, :class_name => 'Keyword', :property => :is_part_of
  
  has_many :projects, :class_name => 'Project', :property => :is_part_of
  has_many :notes, :class_name => 'Note', :property => :is_part_of
  
  has_many :speakers, :class_name => 'Speaker', :property => :is_part_of
  
  
  def get_title
  return "#{self.title}"
end

  def self.data_collection_modes
    {'interview'=>'interview', 'observation'=>'observation', 'content analysis'=>'content analysis', 'questionnaire'=>'questionnaire', 'other'=>'other'}
  end
  
  

  
  
  accepts_nested_attributes_for :descriptions, allow_destroy: true
  accepts_nested_attributes_for :affiliations, allow_destroy: true
  accepts_nested_attributes_for :projects, allow_destroy: true
  accepts_nested_attributes_for :collections, allow_destroy: true
  accepts_nested_attributes_for :ressources, allow_destroy: true
  accepts_nested_attributes_for :depositors, allow_destroy: true
  
  accepts_nested_attributes_for :interviewers, allow_destroy: true
  accepts_nested_attributes_for :interviewers_unknowns, allow_destroy: true

  

  accepts_nested_attributes_for :copyright_holders, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true

  accepts_nested_attributes_for :distributors, allow_destroy: true
  
  accepts_nested_attributes_for :keywords, allow_destroy: true

  accepts_nested_attributes_for :contacts, allow_destroy: true
  accepts_nested_attributes_for :editors, allow_destroy: true
  accepts_nested_attributes_for :notes, allow_destroy: true
  
  accepts_nested_attributes_for :speakers, allow_destroy: true
  
  
  
  
  
 
  
  def self.xml_form
    
    
    builder = Nokogiri::XML::Builder.new do |t|
    
    t.study{
      
      
      
        t.general{
          
       
            t.rec_id(:type=>'text', :required=>true,  :display=>'private')
           
            t.title(:type=>'text', :multiple=>false, :required=>true, :label=>'Study title', :display=>'public')
           
          
            t.association(:type=>'association',:name=>'descriptions', :class_name=>'Description', :required=>true, :display=>'public', :popup=>'false')
          
          
            t.disciplines(:type=>'text', :multiple=>true, :required=>false,  :display=>'public')
          
            t.classifications(:type=>'text', :multiple=>true, :required=>false,  :display=>'private' )
          
            t.association(:type=>'association',:name=>'keywords', :class_name=>'Keyword', :required=>true, :display=>'public', :popup=>'false')
            
            t.coverage_temporal_begin(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'private')
            t.coverage_temporal_end(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'private')

        }
    
      
         t.contributor{
          
            t.association(:type=>'association', :complex=>'true',:name=>'authors', :class_name=>'Author', :required=>true, :display=>'public')
             
            
            
            t.association(:type=>'association', :name=>'projects', :class_name=>'Project', :required=>true, :display=>'public')
              
            
            
            t.association(:type=>'association', :complex=>'true',:name=>'depositors', :class_name=>'Depositor', :required=>true, :display=>'private')
               
            
             t.association(:type=>'association', :complex=>'true',:name=>'distributors', :class_name=>'Distributor', :required=>true, :display=>'private')
      
            
            t.association(:type=>'association', :complex=>'true',:name=>'contacts', :class_name=>'Contact', :display=>'public')
            
            t.contacts_description(:type=>'text_area', :multiple=>false, :required=>true, :display=>'public')

        
      }
     
     
            

        t.universe {
        
            t.location_of_units_of_observations('type'=>'checkbox', :collection=>'location_of_units_of_observations',
              :multiple=>false, :required=>true, :display=>'private')
            
            t.coverage_spatial_countries('type'=>'country', 'multiple'=>true, :required=>true)
              
              
            t.coverage_spatial_geographics(:type=>'text', :multiple=>true, :required=>true, :display=>'private')
            
            t.coverage_spatial_units(:type=>'text', :multiple=>true,:required=>true, :display=>'private')
            
            t.observation_units(:type=>'text', :multiple=>true, :required=>true, :display=>'private')
            
            t.target_groups(:type=>'text', :multiple=>true, :required=>true, :display=>'private')
            
            t.documents_date_begin(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'private', :required=>false)
            t.documents_date_end(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'private', :required=>false)

        }
      
      
              
        t.method_{
            t.data_collection_date_begin(:type=>'date', :required=>false)
            t.data_collection_date_end(:type=>'date', :required=>false)
          
            t.data_collection_time_dimensions(:type=>'checkbox', :required=>true, :collection=>'data_collection_time_dimensions', :display=>'private')
              
            t.data_collection_modes(:type=>'checkbox', :required=>true, :collection=>'data_collection_modes')
                            
            t.data_collection_samplings(:type=>'text', :multiple=>true, :required=>false)
                
               
            t.data_collection_methods(:type=>'checkbox', :required=>true, :collection => 'data_collection_methods', :display=>'private')
             
             t.data_collection_extent(:type=>'text', :multiple=>false)
             t.data_collection_context(:type=>'text_area', :multiple=>false, :required=>true, :display=>'private')
               
             t.data_collection_documents_types(:type=>'checkbox',:collection => 'data_collection_documents')
              
            
            t.data_collection_has_media(:type=>'select', :collection=>'data_collection_has_media', :required=>true,)
            
            

            t.association(:type=>'association', :complex=>'true',:name=>'interviewers', :class_name=>'Interviewer', :required=>true,:popup=>'true')
               
              
            t.association(:type=>'association', :complex=>'true',:name=>'interviewers_unknowns', :class_name=>'Interviewerun', :required=>true, :popup=>'true')
           
        
        }
      
      
        t.edition { 
        
            t.access_conditions(:type=>'text_area', :multiple=>true, :rows=>3)
  
            t.edition_first_date(:type=>'date', :required=>true)
            t.edition_last_date(:type=>'date', :required=>false)
          
          
          
            t.association(:type=>'association', :complex=>'true',:name=>'copyright_holders', :class_name=>'Copyright_holder', :display=>'public', :popup=>'true')
            
            t.softwares(:type=>'text', :multiple=>true, :required=>false)
                        
            t.association(:type=>'association', :complex=>'true',:name=>'editors',  :display=>'public', :class_name=>'Editor', :popup=>'true')
                      
          
        }
      
      
        t.corpus{
                  
            t.archive_accessed(:type=>"select", :required=>true, :collection=>'archive_accessed', :required=>true)
                      
            t.archive_completeness(:type=>'text_area', :required=>true, :rows=>'3')
                      
            t.archive_arrangement_level(:type=>"select", :required=>true, :collection=>'archive_arrangement_level')
                    
            t.archive_arrangement_level_description(:type=>'text_area', :multiple=>false, :required=>false)
            
            t.archive_preservation_level(:type=>'select', :required=>true, :collection=>'archive_preservation_level')
                        
            t.archive_preservation_level_description(:type=>'text_area', :rows=>'3', :required=>false)
            
            t.archive_location(:type=>'text', :multiple=>false, :required=>true)
            
            t.archive_extent(:type=>'text_area', :multiple=>false, :required=>false)
                    
            t.archive_consentement(:type=>"select", :required=>true, :collection=>'archive_consentement')
                    
            t.archive_agreement(:type=>"select", :required=>true, :collection=>'archive_agreement')
                    
 

            #t.documents_count(:type=>'hidden')
            
                   
        }
          
          
          
        t.analyse{
            
            t.analysis_has_transcription(:type=>'checkbox', :collection=>'analysis_has_transcription', :required=>true)
            
            t.analysis_transcription(:type=>"text", :display=>'private')
            t.analysis_anonymization(:type=>'select', :collection=>'analysis_anonymization', :display=>'private')
            
            t.analysis_types(:type=>'checkbox', :collection => 'analysis_types', :multiple=>false, :display=>'private')
            
            
            t.data_languages(:type=>'language_list', :multiple=>true,  :required=>true, :display=>'public') 

            t.documentation_languages(:type=>'language_list', :multiple=>false,  :required=>true, :display=>'private', :multiple=>true) 
            
            t.publication_citation(:type=>'text_area', :multiple=>true, :rows=>3)
            
            t.publications(:type=>'text', :multiple=>true, :display=>'private')
            
                    
            
        
        }
       
       
       
       t.other{
        
          t.association(:type=>'association',:name=>'notes',  :display=>'public', :popup=>'false', :class_name=>'Note', :required=>true)
       }
       
       t.speaker{
        
          t.association(:type=>'association',:name=>'speakers',  :display=>'public', :popup=>'false', :class_name=>'Speaker', :required=>true)
       }
      
      
    }
     
      
    
    
    end
    
    return builder.doc
    
  end
  
  def get_mets
  	
  	builder = Nokogiri::XML::Builder.new do |t|
    
	    t.study{
	    	
	    	#GET XML METADATAS OF THE STUDY
	    	t.__send__ :insert, Nokogiri::XML::DocumentFragment.parse( self.descMetadata.to_xml )
	    	
	    	
	    	
	    	
	    }
    
   end
   
   builder.to_xml
  	
  end
  
  

  
  
end




