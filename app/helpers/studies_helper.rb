module StudiesHelper
  
  def display_study_tree(col)
    html='<ul>'

    col.collections.each do |sub_col|
      html << '<li class="folder">'+sub_col.name
      html << display_study_tree(sub_col)
      html << '</li>'
    end
    
    if col.ressources.empty? == false
      col.ressources.each do |res|
        html << '<li>'+res.name
        html << '</li>'
      end
    end
    
    
    
    html << '</ul>'
    
    return html.html_safe
  end
  
  def hello_world(name)
    "hello #{name}"
  end
    
  
end
