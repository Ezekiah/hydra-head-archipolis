module StudiesHelper
  
  def display_study_tree(col)
    html='<ul>'

    col.collections.each do |sub_col|
      html << '<li data="type:\'collections\'" id="'+sub_col.id+'" class="folder">'+sub_col.name
      html << display_study_tree(sub_col)
      html << '</li>'
    end
    
    if col.ressources.empty? == false
      col.ressources.each do |res|
        html << '<li data="type:\'ressources\'" id="'+res.id+'">'+res.name
        html << '</li>'
      end
    end
    
    
    
    html << '</ul>'
    
    return html.html_safe
  end
  
  
  
  def json_study_tree(col)
    json={}
  
  
    collections = col.collections.map do |col|
      { :id => col.id, :name => col.name, :children=>json_study_tree(col) }
    end
    
    if col.ressources.empty? == false
      col.ressources.map do |res|
         collections << { :id => res.id, :name => res.name}
      end
    end
    
 
    return collections.to_json
  
  end
  
  

    
  
end
