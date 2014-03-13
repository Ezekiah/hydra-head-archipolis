#encoding:utf-8

require 'datastreams/study_metadata'
require 'datastreams/tree_metadata'




class Study < ActiveFedora::Base
  
  
  @@collection_lang = {'fr_FR'=>'fr_FR', 'en_EN'=>'en_EN', }
      
  @@collection_partial = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'partially'=>I18n.t('partially')}
             
  @@collection_dn = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Don\'t know'=>I18n.t('dont_know')}
    
  @@collection_un = {'yes'=>I18n.t('yes'), 'no'=>I18n.t('no'), 'Unknown'=>I18n.t('unknown')}
  
  
  
  
  #attr_reader :title
  
  has_metadata 'descMetadata', type:StudyMetadata
  has_metadata 'utilsMetadata', type:TreeMetadata
  
  
  
  #validates :title,  :presence => true
  

  has_attributes :softwares, datastream: 'descMetadata', multiple: true
  
  has_attributes :edition_first_date, datastream: 'descMetadata', multiple: false
  has_attributes :edition_last_date, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :rec_id, datastream: 'descMetadata', multiple: false
  has_attributes :title, datastream: 'descMetadata', multiple: false
  
  #obsolete
  has_attributes :name, datastream: 'descMetadata', multiple: false
  
  
  has_attributes :documents_count, datastream: 'descMetadata', multiple: false
  
  has_attributes :access_conditions, datastream: 'descMetadata', multiple: false
  
  
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
  has_attributes :archive_agreememt, datastream: 'descMetadata', multiple: false
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
  
  
  
  

  def self.data_collection_modes
    {'interview'=>'interview', 'observation'=>'observation', 'content analysis'=>'content analysis', 'questionnaire'=>'questionnaire', 'other'=>'other'}
  end
  
  

  
  
  accepts_nested_attributes_for :descriptions
  accepts_nested_attributes_for :affiliations
  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :collections
  accepts_nested_attributes_for :ressources
  accepts_nested_attributes_for :depositors
  
  accepts_nested_attributes_for :interviewers
  accepts_nested_attributes_for :interviewers_unknowns

  

  accepts_nested_attributes_for :copyright_holders
  accepts_nested_attributes_for :authors

  accepts_nested_attributes_for :distributors
  
  accepts_nested_attributes_for :keywords

  accepts_nested_attributes_for :contacts
  
  
  
  
  def self.xml_form
    
    
    builder = Nokogiri::XML::Builder.new do |t|
    
    t.study{
      
      
      
        t.general{
          
       
            t.rec_id(:type=>'text', :required=>true,  :display=>'public')
           
            t.title(:type=>'text', :multiple=>false, :required=>true, :label=>'Study title', :display=>'public')
           
          
            t.association(:type=>'association',:name=>'descriptions', :class_name=>'Description', :required=>true, :display=>'public', :popup=>'false')
          
          
            t.disciplines(:type=>'text', :multiple=>true, :required=>false,  :display=>'public')
          
            t.classifications(:type=>'text', :multiple=>true, :required=>false,  :display=>'public' )
          
            t.association(:type=>'association',:name=>'keywords', :class_name=>'Keyword', :required=>true, :display=>'public', :popup=>'false')
            
            t.coverage_temporal_begin(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'public')
            t.coverage_temporal_end(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'public')

        }
    
      
         t.contributor{
          
            t.association(:type=>'association',:name=>'authors', :class_name=>'Author', :required=>true, :display=>'public', :popup=>'true')
             
            
            
            t.association(:type=>'association',:name=>'projects', :class_name=>'Project', :required=>true, :display=>'public', :popup=>'true')
              
            
            
            t.association(:type=>'association',:name=>'depositors', :class_name=>'Depositor', :required=>true, :display=>'public', :popup=>'true')
               
            
             t.association(:type=>'association',:name=>'distributors', :class_name=>'Distributor', :required=>true, :display=>'public', :popup=>'true')
      
            
            t.association(:type=>'association',:name=>'contacts', :class_name=>'Contact', :display=>'public', :popup=>'true')

        
      }
     
     
            

        t.universe {
        
            t.location_of_units_of_observations('type'=>'checkbox', :collection=>[
                    ['international','international'], 
                    ['national','national'],
                    ['infra-national','infra-national'],
                    ['Spire identifier', 'hdl'],
                ], :multiple=>false, :required=>true)
            
            t.coverage_spatial_countries('type'=>'country', 'multiple'=>true, :required=>true)
              
              
            t.coverage_spatial_geographics(:type=>'text', :multiple=>true, :required=>true)
            
            t.coverage_spatial_units(:type=>'text', :multiple=>true,:required=>true)
            
            t.observation_units(:type=>'text', :multiple=>true, :required=>true)
            
            t.target_groups(:type=>'text', :multiple=>true, :required=>true)
            
            t.documents_date_begin(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'public', :required=>false)
            t.documents_date_end(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'public', :required=>false)

        }
      
      
              
        t.method_{
            t.data_collection_date_begin(:type=>'date', :required=>false)
            t.data_collection_date_end(:type=>'date', :required=>false)
          
            t.data_collection_time_dimensions(:type=>'checkbox', :required=>true, :collection=>{
                'one time'=>'one time', 
                'one time interview'=>'one time interview',
                'repeated interview'=>'repeated interview', 
                'observation ponctuelle'=>'observation ponctuelle', 
                'observation systématique'=>'observation systématique', 
                'other'=>'other' 
            })
              
            t.data_collection_modes(:type=>'checkbox', :required=>true, :collection=>{'interview'=>'interview', 
                'observation'=>'observation', 'content analysis'=>'content analysis', 
                'questionnaire'=>'questionnaire', 'other'=>'other'}
            )
                            
            t.data_collection_samplings(:type=>'text', :multiple=>true, :required=>false)
                
               
            t.data_collection_methods(:type=>'checkbox', :required=>true, :collection => {
                'questionnaire'=>'questionnaire', 
                'directive interview'=>'directive interview', 
                'semi-directive interview'=>'semi-directive interview',
                'none directive interview'=>'none directive interview', 
                'participant observation'=>'participant observation', 
                'experimentation'=>'experimentation', 
                'content analysis'=>'content analysis', 
                'other'=>'other' 
             })
             
             t.data_collection_extent(:type=>'text', :multiple=>false)
             t.data_collection_context(:type=>'text_area', :multiple=>false, :required=>true)
               
             t.data_collection_documents_types(:type=>'checkbox',:collection => {
                "collection"=>"collection", 
                "dataset"=>"dataset", 
                "still image"=>"still image", 
                "interactive resource"=>"interactive resource", 
                "moving image"=>"moving image", 
                "physical object"=>"physical object", 
                "software"=>"software", 
                "sound"=>"sound", 
                "text"=>"text"
             })
              
            
            t.data_collection_has_media(:type=>'select', :collection=>@@collection_dn, :required=>true,)
            
            

            t.association(:type=>'association',:name=>'interviewers', :class_name=>'Interviewer', :required=>true,:popup=>'true')
               
              
            t.association(:type=>'association',:name=>'interviewers_unknowns', :class_name=>'Interviewerun', :collection=>@@collection_un, :required=>true, :popup=>'true')
           
        
        }
      
      
        t.edition { 
        
            t.access_conditions(:type=>'text_area', :multiple=>true, :rows=>3)
  
            t.edition_first_date(:type=>'date', :required=>true)
            t.edition_last_date(:type=>'date', :required=>false)
          
          
          
            t.association(:type=>'association',:name=>'copyright_holders', :class_name=>'Agent', :display=>'public', :popup=>'true')
            
            t.softwares(:type=>'text', :multiple=>true, :required=>false)
                        
            t.association(:type=>'association',:name=>'editors',  :display=>'public', :class_name=>'Agent', :popup=>'true')
                      
          
        }
      
      
        t.corpus{
                  
            t.archive_accessed(:type=>"select", :required=>true, :collection=>@@collection_partial, :required=>true)
                      
            t.archive_completeness(:type=>'text_area', :required=>true, :rows=>'3')
                      
            t.archive_arrangement_level(:type=>"select", :required=>true, :collection=>{
                'classed'=>'classed', 
                'Partially classed'=>'Partially classed',
                'heterogeneous'=>'heterogeneous',
                'bulk'=>'bulk'
            })
                    
            t.archive_arrangement_level_description(:type=>'text_area', :multiple=>false, :required=>false)
            
            t.archive_preservation_level(:type=>'select', :required=>true, :collection=>{'good'=>'good', 
                'average'=>'average', 'bad'=>'bad'})
                        
            t.archive_preservation_level_description(:type=>'text_area', :rows=>'3', :required=>false)
            
            t.archive_location(:type=>'text', :multiple=>false, :required=>true)
            
            t.archive_extent(:type=>'text_area', :multiple=>false, :required=>false)
                    
            t.archive_consentement(:type=>"select", :required=>true, :collection=>@@collection_partial.merge(Hash.new('reserves its response'=>'reserves its response')))
                    
            t.archive_agreememt(:type=>"select", :required=>true, :collection=>@@collection_dn)
                    
 

            #t.documents_count(:type=>'hidden')
            
                   
        }
          
          
          
        t.analyse{
            
            t.analysis_has_transcription(:type=>'checkbox', :collection=>@@collection_dn, :required=>true)
            
            t.analysis_transcription(:type=>"text")
            t.analysis_anonymization(:type=>'select', :collection=>@@collection_dn)
            
            t.analysis_types(:type=>'checkbox', :collection => {
                'interpretative'=>'interpretative', 
                'typilogical '=>'typilogical',
                'lexicometric'=>'lexicometric', 
                'coding'=>'coding', 
                'qca'=>'qca', 
                'other'=>'other' }, :multiple=>false
            )
            
            
            t.data_languages(:type=>'language_list', :multiple=>true,  :required=>true, :display=>'public') 

            t.documentation_languages(:type=>'language_list', :multiple=>false,  :required=>true, :display=>'public', :multiple=>true) 
            
            t.publication_citation(:type=>'text_area', :multiple=>true, :rows=>3)
            
            t.publications(:type=>'text', :multiple=>true, :display=>'private')
            
                    
            
        
        }
       
       
       
       t.notes{
        
          t.association(:type=>'association',:name=>'notes',  :display=>'public', :popup=>'false', :class_name=>'Note', :required=>true)
       }
      
      
    }
     
      
      
    
    end
    
    return builder.doc
    
  end
  
end




