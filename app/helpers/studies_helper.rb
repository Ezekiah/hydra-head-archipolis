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

	def display_form(xml, f, xpath_str)

		@xml = Nokogiri::XML.parse(xml)
        
        
        
        
        
        builder = Nokogiri::HTML::Builder.new do |doc|
            doc.body {
                
                
        		tags = @xml.xpath(xpath_str).each do |node|
        		    properties = node.xpath("properties//property")
                    
                    if node.name == 'association'
                        doc.div(:class=>'archi-field control-group', :id=>node.attribute('name')){
                            doc.h4{
                                doc.text(node.attribute('label'))
                                doc.span(:class=>'add-'+node.attribute('name')) {
                                  doc.button(:type=>'button',:class=>'add btn btn-mini', :style=>'margin-left:5px'){
                                         doc.i(:class=>"icon-plus")
                                         
                                  }
                                }
                            }
                
                            
            
                            class_name=node.attribute('class_name').to_s().downcase
            
                            properties.each do |prop|
                              
                                class_name=prop.attribute('class_name').to_s().downcase
                                
                                link = link_to_add_association(' ', f, 
                                        prop.attribute('name').to_s.to_sym, 
                                        :partial=>'/studies/'+class_name+'_fields', 
                                        :data => {"association-insertion-method" => "append" },
                                )
                                
                                
                                
                            
                                doc.text( link.to_s.html_safe )
                                

                              
                            end
                            
                        }
                       
                        
                        
                        elsif node.attribute('type').to_s == 'text'
                             
                             
                            
                             
                             
                             doc.div(:class=>'archi-field control-group'){
                                 doc.text(f.label  node.name, node.attribute('label'))
                                 
                                 doc.div(:class=>'input-append input-prepend'){
                                     
                                     doc.text(f.text_field node.name.to_sym,:multiple=>true , :required=>node.attribute('required'), :value=>'', :class=>'span3',:placeHolder=>"Type something…")
                                         
                                         
                                     if node.attribute('multiple').to_s == 'true'
                                        doc.button(:type=>'button','data-action'=>"add", :class=>'add btn btn-medium'){
                                             doc.i(:class=>"icon-plus")
                                             
                                         }
                                      
                                     end
                                     
                                     doc.button(:type=>'button','data-toggle'=>"tooltip", :class=>'btn btn-default', 'data-placement'=>"right", :title=>"Help"){
                                             doc.text('?')
                                     }
                                     
                                    
                                    
                                     
                                 }
                                 
                                 
                             }
                         
                         
                        elsif node.attribute('type').to_s == 'hidden'
                            
                            doc.div(:class=>'archi-field control-group'){
                            
                                doc.text(f.input node.name, :input_html => { :value => node.attribute('value') }, :as => :hidden)
                        
                            }
                         
                         
                         
                        elsif node.attribute('type').to_s == 'checkbox'
                            
                            doc.div(:class=>'archi-field control-group'){
                            
                                doc.text(f.input node.name, :required=>node.attribute('required'), :label=>node.attribute('label'), :collection => eval(node.attribute('collection').to_s), input_html: { :multiple => 'multiple' }, :as => :check_boxes)
                        
                            }
                        
                        elsif node.attribute('type').to_s == 'radio_buttons'
                            doc.div(:class=>'archi-field control-group'){
                                doc.text(f.input node.name, :label=>node.attribute('label'), :required=>node.attribute('required'), :collection => eval(node.attribute('collection').to_s), :as => :radio_buttons)
                            }    
                        
                      
                        
                        
                        
                        elsif node.attribute('type').to_s == 'country'
                            
                            doc.div(:class=>'archi-field control-group'){

                                doc.div(:class=>'input-append input-prepend'){
                                    doc.text(f.input node.name, :required=>node.attribute('required'), :as => :country, :priority_countries => ['France', 'Germany'], :include_blank => 'Please choose country...')
                                    #doc.text(f.input node.name, :as => :country, :priority_countries => ['France', 'Germany'], :include_blank => 'Please choose country...',  input_html: node.attribute('multiple').to_s=='true'?{ :multiple => 'multiple' }:{})

                                
                                }
                                
                                 if node.attribute('multiple').to_s == 'true'
                                        doc.button(:type=>'button','data-action'=>"add", 'type'=>"button", :class=>'add btn btn-medium'){
                                             doc.i(:class=>"icon-plus")  
                                        }
                                        
                                 end
                                
                             }
                             

                          elsif node.attribute('type').to_s == 'select'
                              
                          
                              doc.div(:class=>'archi-field control-group'){
                                doc.text(f.label  node.name, node.attribute('label'))
                                 
                                doc.div{
                                    doc.text(select_tag node.name, grouped_options_for_select(@LOCATIONS), :required=>node.attribute('required'))
                                }
                                
                                 if node.attribute('multiple').to_s == 'true'
                                        doc.button(:type=>'button','data-action'=>"add", 'type'=>"button", :class=>'add btn btn-medium'){
                                             doc.i(:class=>"icon-plus")  
                                        }
                                        
                                 end
                                
                             }
                          
 
                        elsif node.attribute('type').to_s == 'text_area'
                            
                            doc.div(:class=>'archi-field control-group'){
                                doc.text(f.label  node.name, node.attribute('label'))
                             
                                doc.div(:class=>'input-append input-prepend'){
                                    doc.text(f.text_area node.name.to_sym,:value=>'', :multiple=>true, :required=>node.attribute('required'), :class=>'span3',:placeHolder=>"Type something…")
                                
                                
                                     if node.attribute('multiple').to_s == 'true'
                                        doc.button(:type=>'button','data-action'=>"add", 'type'=>"button", :class=>'add btn btn-medium'){
                                            doc.i(:class=>"icon-plus")
                                        }    
                                     end
                                 
                                 }
                                 
                                
                             }
                            
                           
                            
                        end
                        
                        
                        
                    end	
    
			}

		end

		

	return CGI.unescapeHTML(builder.to_html)

	end

end
