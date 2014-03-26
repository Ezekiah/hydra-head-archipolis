module Studies_mod
  extend ActiveSupport::Concern

  included do

    private
  
    def traverse_study_attr(params, object)
      #recover all _attributes (nested forms)
      obj_attributes = params.select { |key| key.to_s.match(/_attributes$/) }
  
      #foreach association
      obj_attributes.each do |key,value|
  
      #Store model name ***_attributes
  
      #remove _attributes from key to get the association name
        model_property = key.to_s.gsub(/_attributes/, '')
  
        value.each do |k,v|
  
        #Check if sub associations exists
          sub_obj_attributes = v.select { |key| key.to_s.match(/_attributes$/) }
          #recover simple properties
          sub_obj_non_attributes = v.select { |key| !key.to_s.match(/_attributes$/) }
  
          
  
          if !sub_obj_non_attributes.empty?
            
            
  
            if v.has_key?("rec_class")
  
              rec_class = Object.const_get(v['rec_class'])
  
              if v.has_key?("id") && v["id"]!=""
                debugger
                updateObject = Object.const_get(v['rec_class']).find(v['id'])
  
                if  v.has_key?("rec_delete") && v["rec_delete"]=="true"
                  updateObject.delete()
  
                else
                  
                  #updateObject.update(sub_obj_non_attributes.select { |key| !key.to_s.match(/_destroy|id|rec_id$/) })
                  debugger
                  updateObject.update(sub_obj_non_attributes.except('_destroy', 'id', 'rec_id'))
  
                  if !sub_obj_attributes.empty?
  
                    traverse_study_attr(sub_obj_attributes, updateObject)
  
                  end
  
                end
  
              else
                
                #newObject = rec_class.new(sub_obj_non_attributes.select { |key| !key.to_s.match(/_destroy|rec_id$/) })
                newObject = rec_class.new(sub_obj_non_attributes.except('_destroy', 'id', 'rec_id'))

                object.send(model_property) << newObject
  
                
                
                if !sub_obj_attributes.empty?
  
                  traverse_study_attr(sub_obj_attributes, newObject)
  
                end
              end
  
            end
  
          end
  
        end
  
      end
  
    end

  end

  module ClassMethods
      
     

  end
end