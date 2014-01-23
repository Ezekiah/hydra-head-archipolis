require 'datastreams/collection_metadata'

class Collection < ActiveFedora::Base
    has_metadata 'descMetadata', type:CollectionMetadata
    
    has_attributes :title, datastream: 'descMetadata', multiple: false
    has_attributes :rec_type, datastream: 'descMetadata', multiple: false
    
    
    
    
    has_many :collections, :property=>:is_member_of_collection
    has_many :ressources, :property=>:is_member_of_collection
    belongs_to :collection, :property => :is_member_of_collection
    belongs_to :study, :property => :is_member_of_collection
    
    accepts_nested_attributes_for :ressources
    
    has_many :files
    
   def as_json(options={})
    { :id => self.id,
      :name => self.name,
      :collections => self.collections,
      :ressources => self.ressources,
    }
  end
  
  
  
  def html_form()
   
     builder = Nokogiri::HTML::Builder.new do |doc|
      
      doc.form {
        doc.h1 "Metadatas collection"
        doc.div{
          doc.text "name : "
          doc.input(:type=>'text', :name=>'name', :value=>self.title) {
            doc.text "name"
          }
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
            
            if col.name == self.collection.title
              option[:selected] = 'true'
            end

            doc.option(option).text(col.title)
          end
          

        }
        
        
        doc.input(:type=>'submit', :value=>'update')
        
      }
    end
    return builder.doc
   
  end
  
end
