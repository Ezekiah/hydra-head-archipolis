require 'datastreams/ressource_metadata'

class Ressource < ActiveFedora::Base
    has_metadata 'descMetadata', type:RessourceMetadata
    
    has_attributes :name, datastream: 'descMetadata', multiple: false
    has_attributes :type, datastream: 'descMetadata', multiple: false
    has_attributes :title, datastream: 'descMetadata', multiple: false
    has_attributes :label, datastream: 'descMetadata', multiple: false
    
    
    has_file_datastream "documentContent"
    
    has_many :files, :property => :is_member_of_collection, :class_name => "ActiveFedora::Base"
    has_many :ressources, :property=>:is_member_of_collection
    
    belongs_to :collection, :property => :is_member_of_collection
    belongs_to :study, :property => :is_member_of_collection
    belongs_to :ressource, :property => :is_member_of_collection
    
    def as_json(options={})
    { 
      :id => self.id,
      :name => self.name,
      :ressources => self.ressources
    }
    end
    
    
   def html_form()
   
     builder = Nokogiri::HTML::Builder.new do |doc|
      
      
      
      doc.form {
        doc.h1 "Metadatas ressources"
        doc.div{
          doc.text "name : "
          doc.input(:type=>'text', :name=>'name', :value=>self.name) {
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
        
        
        if self.type == 'custom'
          option[:checked] = 'checked'
        end
         if self.type == 'bequali'
          option2[:checked] = 'checked'
        end
        
        
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
            
            if col.name == self.collection.name
              option[:selected] = 'true'
            end

            doc.option(option).text(col.name)
          end
          

        }
        doc.input(:type=>'submit', :value=>'update')
        
        
      }
    end
    return builder.doc.to_html()
   
  end
    
end
