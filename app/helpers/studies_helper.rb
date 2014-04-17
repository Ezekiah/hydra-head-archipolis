module StudiesHelper
  
  def generate_edit_boxes(f, node_name, class_name, is_complex_assoc, uid_accordion, parent)

        
      uid2 = SecureRandom.uuid
      uid = SecureRandom.uuid
       

      render_tpl = render(:partial=>'/studies/display_fields', :locals=>{:f=>f,
      :edit=>true,:xml=>Object.const_get(class_name.capitalize).xml_form.to_xml,  
      :xpath=>'/'+class_name.to_s.singularize.downcase+'/*'}).html_safe

      
      edit_box_tpl = call_jst('edit-box.jst.eco',  {uid2:uid2, 
        label_link:generate_title(f.object)}).html_safe

      modal = Nokogiri::HTML.fragment(render_tpl)

      updated_hidden = Nokogiri::HTML::Builder.new do |doc| 
        doc.div{
        	doc.input(:class=>'updated-hidden', :type=>'hidden', :name=>f.object_name+'[updated]', :value=>'false', :id=>'updated-'+f.object.id)
        	
        	
      	}
      end
      
      edit_box_tpl + call_jst('modal.jst.eco',  {id:'content-'+uid2, 
        title:t('edit-box.'+class_name.downcase).capitalize, 
        content:modal.to_html+updated_hidden.doc.to_html}).html_safe
      
    
    
    
  end
  
  
  
  def generate_accordions(f, node_name, class_name, is_complex_assoc, uid_accordion, parent)
        
                  
    uid2 = SecureRandom.uuid
    uid = SecureRandom.uuid
    
    updated_hidden = Nokogiri::HTML::Builder.new do |doc| 
      doc.div{
      	doc.input(:class=>'updated-hidden', :type=>'hidden', :name=>f.object_name+'[updated]', :value=>'false', :id=>'updated-'+f.object.id)
      	doc.input(:type=>'hidden', "data-name"=>'assoc_title', :value=>generate_title(f.object) )
      }
    end
    
    render_tpl = render(:partial=>'/studies/display_fields', :locals=>{:f=>f,
    :edit=>true,:xml=>Object.const_get(class_name.capitalize).xml_form.to_xml,  
    :xpath=>'/'+class_name.to_s.singularize.downcase+'/*',
    :in_association=>true}).html_safe + updated_hidden.doc.to_html.html_safe
  	
  	
   
    if !! parent.object.descMetadata.to_s.match('AgentMetadata') == true
      test = Nokogiri::HTML::Builder.new do |doc| 
        doc.input(:class=>'data-complex', :type=>'hidden', :value=>true)
      end
      
      accordion = render_tpl + test.doc.to_html.html_safe
      
    
    else
      
      accordion = render_tpl
      
      
      
 
    end
    
    
    
    accordion
	
    
  end
  
  
  
	def display_study_tree(col)
		html='<ul>'

		col.collections.each do |sub_col|
			html << '<li data="type:\'collections\'" id="'+sub_col.id+'" class="folder">'+sub_col.title
			html << display_study_tree(sub_col)
			html << '</li>'
		end

		if col.ressources.empty? == false
			col.ressources.each do |res|
				html << '<li data="type:\'ressources\'" id="'+res.id+'">'+res.file_name
				html << '</li>'
			end
		end

		html << '</ul>'

		return html.html_safe
	end

	def json_study_tree(col)
		json={}

		collections = col.collections.map do |col|
			{ :id => col.id, :name => col.title, :children=>json_study_tree(col) }
		end

		if col.ressources.empty? == false
			col.ressources.map do |res|
				collections << { :id => res.id, :name => res.file_name}
			end
		end

		return collections.to_json

	end


  def generate_title(object)
    
    class_name = object.class.to_s
    
    first_arg = ' '
    second_arg = ' '
    
    if class_name == 'Identifier'
      first_arg = object.id_type.to_s
      second_arg = object.value[0]
    
    
    elsif class_name == 'Description' or class_name == 'Note' or class_name == 'Keyword' or class_name == 'Award'
      first_arg = object.language
      second_arg = object.value
    
    
    elsif class_name == 'Address'
      first_arg = object.street
    
    
    elsif class_name == 'Affiliation'
      first_arg = object.rec_id
      second_arg = object.name
    

    elsif class_name == 'Project'
      first_arg = object.title
    
    
    elsif class_name == 'Person'
      first_arg = "#{object.name_family} #{object.name_given}"
      
    elsif class_name == 'Orgunit'
      first_arg = object.name

    else
      first_arg = object.get_title
      
    
    end
    
    
    
    
    title = "#{first_arg} #{second_arg}"

    title
    
  end
  

    def gen_select (f, node, collection, prompt)
        return f.select node.name, collection, :input_html => { :required => node.attribute('required') }, :prompt => prompt
    end
    
    def gen_add_button(jst, params=false)
        file = File.join(Rails.root, 'app', 'assets', 'javascripts', 'templates', jst )
        Eco.render(File.read(file), params)
    end
    
    def call_jst(jst, params=false)
        file = File.join(Rails.root, 'app', 'assets', 'javascripts', 'templates', jst )
        Eco.render(File.read(file), params)
    end
    
    def gen_help_button( params=false)
        file = File.join(Rails.root, 'app', 'assets', 'javascripts', 'templates', 'button_help.jst.eco' )
        params['title']=t('help')
        
        Eco.render(File.read(file), params)
    end
    
   
    
    
    
  def render_as_str(partial, params)
    
    render_to_string(:partial=>partial, :locals=>params)
    
  end

	

end
