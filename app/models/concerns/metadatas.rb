module Agent_metadata
  extend ActiveSupport::Concern
  
  
  included do
      
      include Hydra::AccessControls::Permissions
      
      has_metadata 'descMetadata', type:AgentMetadata
      
     
      has_attributes :rec_class, datastream: 'descMetadata', multiple: false
      has_attributes :rec_id, datastream: 'descMetadata', multiple: false
      
      has_many :orgunits, :property=>:is_part_of, :class_name=>"Orgunit"
      has_many :persons, :property=>:is_part_of, :class_name=>"Person"
     
      
      accepts_nested_attributes_for :orgunits, allow_destroy: true
      accepts_nested_attributes_for :persons, allow_destroy: true
      
      def get_title
        
        if !self.orgunits.empty?
          return self.orgunits.first.name
          
        elsif !self.persons.empty?
          return "#{self.persons.first.name_family} #{self.persons.first.name_given}"
        end
        
      end 
      

  end

  module ClassMethods
      
      def xml_form
     
          builder = Nokogiri::XML::Builder.new do |t|
           
           t.send(self.name.downcase){      
              t.association(:type=>'association', :name=>'orgunits',  :display=>'public', :class_name=>'Orgunit')
              t.association(:type=>'association', :name=>'persons',  :display=>'public', :class_name=>'Person')
              t.rec_class(:type=>'hidden', :value=>self.name)
              t.rec_delete(:type=>'hidden', :value=>false, :label=>'', :display=>'public', 'data-name'=>'rec_delete')

              
           }  
    
        end
        
        builder.doc
    
      end

  end
end

module Common_metadata
  extend ActiveSupport::Concern
  
  included do
      include Hydra::AccessControls::Permissions
    
      has_attributes :rec_class, datastream: 'descMetadata', multiple: false
      
      
  end

  
end
    

    