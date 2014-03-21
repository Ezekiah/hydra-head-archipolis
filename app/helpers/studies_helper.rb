

module StudiesHelper
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

	def display_form(xml, f, xpath_str, str=false)

		@xml = Nokogiri::XML.parse(xml)
        
        builder = Nokogiri::HTML::Builder.new do |doc|
            doc.body {

        		tags = @xml.xpath(xpath_str).each do |node|
        		    
        		    root_node = node.parent
        		    
        		    properties = node.xpath("properties//property")
        		   
        		    
                    if node.attribute('display').to_s != 'private'
                    
                        if node.name == 'association'
                            doc.div(:class=>'archi-field control-group', :id=>node.attribute('name'), 'data-singular-name'=>t('edit-box.'+node.attribute('name').to_s.singularize)){
 
                                doc.text(f.label  node.name, t(root_node.name.to_s+'.'+node.attribute('name')+'.label'), :class=>node.attribute('required')?'required':'')

                                doc.div(:class=>'input-append input-prepend'){

                                    doc.div(:id=>'add-'+node.attribute('name')) {
                                        
                                        class_name = node.search('.//property').attribute('class_name').to_s
                                      
                                      
                                      if node.search('.//property').size.to_s == '2'
                                           doc.text(gen_add_button('button_list.jst.eco',{ orgunit: t("orgunit.label"), person: t("person.label"), title:t('help'), title_help:t(root_node.name.to_s+'.'+node.attribute('name')+'.help'),type:'association' }      ))
                                        else
                                          doc.text(gen_add_button('button_add.jst.eco',{type:'association'}))
                                          doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.attribute('name')+'.help')} ))
                                  
                                        end
                                        
                                       
                                    }
                                 }
                                 
                                class_name=node.attribute('class_name').to_s().downcase

                                properties.each do |prop|
                                      
                                    class_name=prop.attribute('class_name').to_s().downcase
                                    
                                    metadata_class = class_name.capitalize+'Metadata'
                                    
                                     link = link_to_add_association(' ', f, 
                                            prop.attribute('name').to_s.to_sym, 
                                            :partial=>'/studies/display_fields', 
                                            :render_options => {:locals => {
                                                :xml=>Object.const_get(metadata_class).xml_form.to_xml, 
                                                :xpath=>'/'+class_name.to_s.singularize+'/*'}, 
                                                },
                                            :data => {"association-insertion-method" => "before" },
                                    )
                                    
                                     html = Nokogiri::HTML(link)   
                                            a = html.css('a')
                                            
                                            if node.attribute('popup').to_s == 'false'
                                                doc.text(a[0]['data-association-insertion-template'].to_s.html_safe)
                                            end
                                   
                                    
                                                                           
                                    
                                    
                                    doc.div{
                                        doc.text( link.to_s.html_safe )
                                        
                                    } 
    
                                  
                                end

                            }
                                 

                            elsif node.attribute('type').to_s == 'text'
    
                                 doc.div(:class=>'archi-field control-group'){
                                     doc.text(f.label  node.name, t(root_node.name.to_s+'.'+node.name.to_s+'.label'), :class=>node.attribute('required')?'required':'')
                                     
                                     doc.div(:class=>'input-append input-prepend'){
                                         
                                         doc.text(f.text_field node.name.to_sym,:multiple=>true , :required=>node.attribute('required'), :value=>'', :class=>'span3',:placeHolder=>t("type_something"))
                                             
                                             
                                         if node.attribute('multiple').to_s == 'true'
                                           doc.text(gen_add_button('button_add.jst.eco',{type:'single'}))
                                         end
                                         
                                        doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')} ))
                                        
                                        

                                     }
  
                                 }
                             
                             
                            elsif node.attribute('type').to_s == 'hidden'
                                
                                doc.div(:class=>'archi-field control-group'){
                                
                                    doc.text(f.input node.name, :input_html => { :value => node.attribute('value') }, :as => :hidden)
                            
                                }
                             
                             
                             
                            elsif node.attribute('type').to_s == 'checkbox'
                                
                                doc.div(:class=>'archi-field control-group'){
                                    doc.text(f.input node.name, :required=>node.attribute('required'), :label=>node.name, :collection => eval(node.attribute('collection').to_s), input_html: { :multiple => 'multiple' }, :as => :check_boxes)
                                }
                                
                                
                                 
                                 
                                
                            
                            elsif node.attribute('type').to_s == 'radio_buttons'
                                doc.div(:class=>'archi-field control-group'){
                                    doc.text(f.input node.name, :label=>t('label.'+node.name), :required=>node.attribute('required'), :collection => eval(node.attribute('collection').to_s), :as => :radio_buttons)
                                }
                                
                                
                                doc.div(:class=>'input-append input-prepend'){
                                    
                                if node.attribute('multiple').to_s == 'true'
                                    doc.text(gen_add_button('button_add.jst.eco',{type:'single'})) 
                                 end
                                
                                
                                     doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')} ))
                                 }
                          
                            
                            
                            
                            elsif node.attribute('type').to_s == 'country'

                                doc.text(f.input node.name, :label=>t('label.'+node.name),:required=>node.attribute('required'), :as => :country, :priority_countries => ['France', 'Germany'], :include_blank => t('Please choose country...'))
                                #doc.text(localized_language_select(node.name, :language, [], :include_blank => 'Please choose...'))

                                
                                 
                                 doc.div(:class=>'input-append input-prepend'){
                                  if node.attribute('multiple').to_s == 'true'
                                    doc.text(gen_add_button('button_add.jst.eco',{type:'single'}))                                           
                                 end
                                 doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')}))
                                     
                                 }

                               
                               elsif node.attribute('type').to_s == 'date'
    
                                 doc.div(:class=>'archi-field control-group'){
                                     doc.text(f.label  node.name, t(root_node.name.to_s+'.'+node.name.to_s+'.label'), :class=>[node.attribute('required')?'required':'', ''])
                                     
                                     doc.div(:class=>'input-append input-prepend'){
                                         
                                         doc.text(f.text_field node.name.to_sym,:multiple=>true , 
                                            'data-date-view-mode'=>node.attribute('viewMode'),
                                            'data-date-min-view-mode'=>node.attribute('minViewMode'), 
                                            "data-provide"=>"datepicker", 
                                            'data-date-format'=>node.attribute('format'), 
                                            :required=>node.attribute('required'), 
                                            :value=>'', 
                                            :class=>'span3',
                                            :placeHolder=>t("date_click")
                                         )
                                             
                                         
                                         
                                         
                                         doc.span(:type=>'button', :class=>'add-on', 'data-placement'=>"right", :title=>t("calendar")){
                                            doc.text('<i data-time-icon="icon-time" class="icon-th"></i>')
                                         }
                                         
                                        
                                         
                                   
                                             
                                          if node.attribute('multiple').to_s == 'true'
                                            doc.text(gen_add_button('button_add.jst.eco',{type:'single'})) 
                                         end
                                         
                                         doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')} ))
                                         
                                       
                                           
                                     }
 
                                 }

                              elsif node.attribute('type').to_s == 'language_list'

                                  doc.div(:class=>'archi-field control-group'){
                                    doc.text(f.label  node.name, t(root_node.name.to_s+'.'+node.name.to_s+'.label') )
                                     
                                    
                                    doc.text(gen_select(f, node, grouped_options_for_select(@LOCATIONS), t("choose_language")))
                                    
                                    
                                    doc.div(:class=>'input-append input-prepend'){
                                             
                                          if node.attribute('multiple').to_s == 'true'
                                            doc.text(gen_add_button('button_add.jst.eco',{type:'single'})) 
                                         end
                                         
                                         doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')} ))
                                     }
                                
                                 }
                                 
                            elsif node.attribute('type').to_s == 'select'
                                  
                                  
                                  
                                  doc.div(:class=>'archi-field control-group'){
                                    doc.text(f.label  node.name, t(root_node.name.to_s+'.'+node.name.to_s+'.label') )
                                    
                           
                                    
                                        doc.text(
                                            gen_select(f, node, eval(node.attribute('collection').to_s), node.attribute('prompt'))
                                        )
                                        
                                    
                                    doc.div(:class=>'input-append input-prepend'){
                                             
                                              if node.attribute('multiple').to_s == 'true'
                                                doc.text(gen_add_button('button_add.jst.eco',{type:'single'})) 
                                             end
                                             
                                             doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')} ))
                                         }
                                    
                                 }
                              
     
                            elsif node.attribute('type').to_s == 'text_area'
                                
                                doc.div(:class=>'archi-field control-group'){
                                    doc.text(f.label  node.name, t(root_node.name.to_s+'.'+node.name.to_s+'.label'))
                                 
                                    doc.div(:class=>'input-append input-prepend'){
                                        doc.text(f.text_area node.name.to_sym,:value=>'', :multiple=>true, :required=>node.attribute('required'), :class=>'span3',:placeHolder=>t("type_something"))
                                    
                                    
                                         doc.div(:class=>'input-append input-prepend'){
                                             
                                              if node.attribute('multiple').to_s == 'true'
                                                doc.text(gen_add_button('button_add.jst.eco',{type:'single'})) 
                                             end
                                             
                                             doc.text(gen_help_button({title_help:t(root_node.name.to_s+'.'+node.name+'.help')} ))
                                         }
                                     
                                     }
                                     
                                    
                                 }

                            end
                        end

                    end	
    
			}

		end

		

	return CGI.unescapeHTML(builder.to_html)

	end

end
