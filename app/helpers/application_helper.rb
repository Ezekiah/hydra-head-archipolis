module ApplicationHelper
  
  def link_to_add_fields(name, f, association, locals)
  
   
    new_object = create_object(f, association)
    id = new_object.object_id
    
 
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(new_object.class.name.downcase + "_fields", locals.merge({f: builder}) )
      #render :partial => new_object.class.name.downcase+"_fields", :locals => locals.merge({f:builder})
    
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  
  def create_object(f, association, force_non_association_create=false)
      assoc = f.object.class.reflect_on_association(association)

      assoc ? create_object_on_association(f, association, assoc, force_non_association_create) : create_object_on_non_association(f, association)
  end
    
end
