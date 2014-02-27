class StudyMetadata < ActiveFedora::OmDatastream
  

  set_terminology do |t|
      
      t.root(path: "metadatas")
      
      
      t.depositors

      t.copyright_holders
      t.softwares
      t.editors
      t.edition_first_date
      t.edition_last_date
      t.distributors
      t.projects
      t.authors
      
      
      t.rec_id
      t.title
      t.name
      t.documents_count
      t.archive_extent
      t.archive_location
      t.access_conditions
      
      
    
      t.contacts
      t.data_collection_modes
      t.data_collection_context
      t.data_collection_methods
      t.data_collection_samplings
      t.data_collection_time_dimensions
      t.publications
      t.descriptions
      t.disciplines
      
      t.analysis_types
      t.analysis_anonymization
      t.keywords
      
      
      t.classifications
      t.observation_units
      t.data_collection_date_begin
      t.data_collection_date_end
      
      
      
      
      t.analysis_transcription
      t.coverage_spatial_geographics
      t.coverage_spatial_units
      t.coverage_spatial_countries
      t.coverage_temporal_begin
      t.coverage_temporal_end
      t.target_groups
      t.location_of_units_of_observations
      t.data_languages
      t.documentation_languages
    
    
    
      t.documents_date_begin
      t.documents_date_end
      t.media_files
      t.documents_transc_count
      t.interviewers
      t.archive_completeness
      t.archive_arrangement_level
      t.archive_consentement
      t.archive_agreememt
      t.notes
      
      t.documents_types
          
    

  end
  
  def self.xml_template
    
    Nokogiri::XML.parse("<metadatas/>")
    
  end
  

  def self.xml_form
    
    
    builder = Nokogiri::XML::Builder.new do |t|
    
    t.study{
      
      
      
      t.general{
          
       
           t.rec_id(:type=>'text', :required=>true, :label=>'Identifier', :display=>'public')
           
           t.title(:type=>'text', :multiple=>false, :required=>true, :label=>'Study title', :display=>'public')
           
          
            t.association(:name=>'descriptions', :label=>'Abstracts', :required=>true, :display=>'public'){
              t.properties{
                t.property(:name=>'descriptions', :class_name=>'Description')
              }          
            }
          
          
          t.disciplines(:type=>'text', :multiple=>true, :required=>false, :label=>'Disciplines', :display=>'public')
          
          t.classifications(:type=>'text', :multiple=>true, :required=>false, :label=>'Classifications', :display=>'public' )
          
          t.association(:name=>'keywords', :label=>'keywords', :required=>true, :display=>'public'){
              t.properties{
                t.property(:name=>'keywords', :class_name=>'Keyword')
              }          
          }
          
          t.coverage_temporal_begin(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'public')
          t.coverage_temporal_end(:type=>'date', :format=>'yyyy', :viewMode=> "years", :minViewMode=> "years", :display=>'public')

      }
    
      
      t.contributor{
          
           t.association(:name=>'authors', :label=>'authors', :required=>true, :display=>'public'){
              t.properties{
                t.property(:name=>'person_authors', :class_name=>'Person')
                t.property(:name=>'orgunit_authors', :class_name=>'Orgunit')
              }
            }
            
            
            t.association(:name=>'projects', :label=>'projects', :required=>true, :display=>'public'){
               t.properties{
                    t.property(:name=>'projects', :class_name=>'Project', :popup=>true)
               }     
            }
            
            
            t.association(:name=>'depositors', :label=>'depositors', :required=>true, :display=>'public'){
                t.properties{
                   t.property(:name=>'person_depositors', :class_name=>'Person')
                   t.property(:name=>'orgunit_depositors', :class_name=>'Orgunit')
               }        
            }
            
             t.association(:name=>'distributors', :label=>'distributors', :required=>true, :display=>'public'){
               t.properties{
                t.property(:name=>'person_distributors', :class_name=>'Person')
                t.property(:name=>'orgunit_distributors', :class_name=>'Orgunit') 
                 
               }       
            }
            
            t.association(:name=>'contacts', :label=>'contacts', :display=>'public'){
               t.properties{
                    t.property(:name=>'person_contacts', :class_name=>'Person')
                    t.property(:name=>'orgunit_contacts', :class_name=>'Orgunit')
               }       
            }

        
      }
     
     
      
      
      
      t.step3{
        t.coverage_spatial_geographics(:type=>'text', :multiple=>true)
        t.coverage_spatial_units(:type=>'text', :multiple=>true)
       
        t.association(:name=>'interviewers', :label=>'interviewers'){
               t.property(:name=>'person_interviewers', :class_name=>'Person')
               t.property(:name=>'orgunit_interviewers', :class_name=>'Orgunit')          
            }
        
        
        t.target_groups(:type=>'text', :multiple=>true)
        
        t.location_of_units_of_observations('type'=>'checkbox', :collection=>{
           'international'=>'international', 
           'national'=>'national', 
           'infra-national'=>'infra-national' 
         })
         
        t.data_languages('type'=>'checkbox', :collection=> {
          'fr_FR'=>'fr_FR', 
          'en_EN'=>'en_EN', 
       })
       
        
        
        
        
      }
      
      t.step4{
          
          
           t.coverage_spatial_countries('type'=>'country', 'multiple'=>false)
          
          t.softwares(:type=>'text', :multiple=>true, :required=>false)
    
          
          t.edition_first_date(:type=>'date', :required=>true)
          t.edition_last_date(:type=>'date', :required=>true)
          
          t.documents_date_begin(:type=>'date', :required=>true)
          t.documents_date_end(:type=>'date', :required=>true)
          
          t.data_collection_date_begin(:type=>'date', :required=>false)
          t.data_collection_date_end(:type=>'date', :required=>false)
          
           t.data_collection_modes(:type=>'checkbox', :collection=>{'interview'=>'interview', 
              'observation'=>'observation', 'content analysis'=>'content analysis', 
              'questionnaire'=>'questionnaire', 'other'=>'other'}
            )
          
          
          #t.projects(:type=>'association', :class_name=>'Project')
          
         
          
          
          
          
          t.documents_count(:type=>'hidden')
          t.archive_extent(:type=>'text', :multiple=>false, :required=>false)
          t.archive_location(:type=>'text', :multiple=>false, :required=>false)
          t.access_conditions(:type=>'text', :multiple=>true)
          
          

           
            
            t.data_collection_context(:type=>'text', :multiple=>false)
            
            t.data_collection_methods(:type=>'checkbox', :collection => {
              'questionnaire'=>'questionnaire', 
              'directive interview'=>'directive interview', 
              'semi-directive interview'=>'semi-directive interview',
              'none directive interview'=>'none directive interview', 
              'participant observation'=>'participant observation', 
              'experimentation'=>'experimentation', 
              'content analysis'=>'content analysis', 
              'other'=>'other' 
             })
             
              t.data_collection_samplings(:type=>'text', :multiple=>true)
            
            t.data_collection_time_dimensions(:type=>'checkbox', :collection=>{
              'one time'=>'one time', 
              'one time interview'=>'one time interview',
              'repeated interview'=>'repeated interview', 
              'observation ponctuelle'=>'observation ponctuelle', 
              'observation systématique'=>'observation systématique', 
              'other'=>'other' 
            })
             
            t.documents_types(:type=>'checkbox',:collection => {
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
              
            t.publications(:type=>'text', :multiple=>true)
           
            
            t.analysis_types(:type=>'checkbox', :collection => {
              'analyse interprétative simple'=>'analyse interprétative simple', 
              'analyse typologique '=>'analyse typologique ',
              'other'=>'other' }
            )
            
            t.analysis_anonymization(:type=>'radio_buttons')
            
            
            
            
            
            t.observation_units(:type=>'text', :multiple=>true)
            
            
            t.analysis_transcription(:type=>"radio_buttons")
        
        t.documentation_languages('type'=>'checkbox', :collection=> {
        'fr_FR'=>'fr_FR', 
        'en_EN'=>'en_EN', 
         })
      
  
        
        
        t.archive_completeness(:type=>'text')
        t.archive_arrangement_level(:type=>"radio_buttons")
        t.archive_consentement(:type=>"radio_buttons")
        t.archive_agreememt(:type=>"radio_buttons")
        
        t.notes(:type=>'text', :multiple=>true)
        
       
        
         t.association(:name=>'copyright_holders', :label=>'copyright_holders'){
           t.property(:name=>'person_copyright_holders', :class_name=>'Person')
           t.property(:name=>'orgunit_copyright_holders', :class_name=>'Orgunit')          
        }
        
         t.association(:name=>'editors', :label=>'editors'){
           t.property(:name=>'person_editors', :class_name=>'Person')
           t.property(:name=>'orgunit_editors', :class_name=>'Orgunit')          
        }
      

        
      }
      
      
      }
     
      
      
    
    end
    
    return builder.doc
    
  end
  
  
  
  
  
end
