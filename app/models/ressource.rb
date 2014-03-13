require 'datastreams/ressource_metadata'
require 'datastreams/metadatas.rb'


class Ressource < ActiveFedora::Base
    has_metadata 'descMetadata', type:RessourceMetadata
    

    
    has_attributes :checksum, datastream: 'descMetadata', multiple: false
    has_attributes :checksum_type, datastream: 'descMetadata', multiple: false
    has_attributes :content_date, datastream: 'descMetadata', multiple: false
    has_attributes :description, datastream: 'descMetadata', multiple: true
    
    has_attributes :digital_origin, datastream: 'descMetadata', multiple: false
    has_attributes :dissemination, datastream: 'descMetadata', multiple: false
    has_attributes :file, datastream: 'descMetadata', multiple: false
    has_attributes :file_name, datastream: 'descMetadata', multiple: false
    has_attributes :file_name_original, datastream: 'descMetadata', multiple: false
    has_attributes :file_size, datastream: 'descMetadata', multiple: false
    has_attributes :format_compression, datastream: 'descMetadata', multiple: false
    has_attributes :format_compression_ratio, datastream: 'descMetadata', multiple: false
    has_attributes :format_encodage, datastream: 'descMetadata', multiple: false
    has_attributes :format_mimetype, datastream: 'descMetadata', multiple: false
    has_attributes :format_pronom, datastream: 'descMetadata', multiple: false
    has_attributes :format_structure, datastream: 'descMetadata', multiple: false
    has_attributes :format_structure_type, datastream: 'descMetadata', multiple: false
    has_attributes :format_version, datastream: 'descMetadata', multiple: false
    has_attributes :language, datastream: 'descMetadata', multiple: true
    has_attributes :note, datastream: 'descMetadata', multiple: false
    has_attributes :order, datastream: 'descMetadata', multiple: false
    has_attributes :processing_software_name, datastream: 'descMetadata', multiple: false
    has_attributes :rec_created_date, datastream: 'descMetadata', multiple: false

    include Common_metadata
    
    
    has_attributes :rec_modified_date, datastream: 'descMetadata', multiple: false
    has_attributes :rec_type, datastream: 'descMetadata', multiple: false
    has_attributes :subject_country, datastream: 'descMetadata', multiple: false
    has_attributes :subject_topic, datastream: 'descMetadata', multiple: false
    has_attributes :title, datastream: 'descMetadata', multiple: false
    has_attributes :url, datastream: 'descMetadata', multiple: false



    has_file_datastream "documentContent"
    
    #has_many :files, :property => :is_member_of_collection, :class_name => "ActiveFedora::Base"
    has_many :ressources, :property=>:is_member_of_collection
    
    belongs_to :collection, :property => :is_member_of_collection
    belongs_to :study, :property => :is_member_of_collection
    belongs_to :ressource, :property => :is_member_of_collection


    accepts_nested_attributes_for :ressources





    
    def as_json(options={})
    { 
      :id => self.id,
      :title => self.title,
      :ressources => self.ressources
    }
    end
    
    
   def html_form()
   
     builder = Nokogiri::HTML::Builder.new do |doc|
      
      doc.form {
        doc.h1 "Metadatas ressources"
        doc.div{
          doc.text "name : "
          doc.input(:type=>'text', :name=>'name', :value=>self.title) {
            doc.text "name"
          }
        }
        
        doc.div{
          doc.text "title : "
          doc.input(:type=>'text', :name=>'title', :value=>self.title)
        }
        
        doc.div{
          doc.text "label : "
          doc.input(:type=>'text', :name=>'label', :value=>self.label)
        }
        
        option = {:type=>'radio', :name=>'type', :value=>'custom'}
        option2 = {:type=>'radio', :name=>'type', :value=>'bequali'}
        
        
        #if self.type == 'custom'
        #  option[:checked] = 'checked'
        #end
        # if self.type == 'bequali'
        #  option2[:checked] = 'checked'
        #end
        
        
        doc.div{
          doc.text "custom"
          doc.input(option)
          doc.br
          doc.text "bequali"
          doc.input(option2)        
          
        }
        
        study_collections = self.study.collections

        doc.select(:name=>'collections'){
          doc.text "custom"
          
          study_collections.each do |col|
            option = {:name=>'collection', :value=>col.id}
            
            if col.title == self.collection.title
              option[:selected] = 'true'
            end

            doc.option(option).text(col.title)
          end
          

        }
        doc.input(:type=>'submit', :value=>'update')
        
        
      }
    end
    return builder.doc.to_html()
   
  end
    
end
