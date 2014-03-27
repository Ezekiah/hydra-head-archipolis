
String::capitalize = ->
  @charAt(0).toUpperCase() + @slice(1)

s4 = ->
  Math.floor((1 + Math.random()) * 0x10004425470).toString(16).substring 1
  

check_hidden_assoc =  (zone, selector) ->
  
  if parseInt(zone.find(selector).size()) > 0
    zone.find("#hidden-"+zone.attr('id')).val('filled')
  else
    zone.find("#hidden-"+zone.attr('id')).val('')

  


initialize_accordions = undefined
initialize_accordions = ->
  

  $('.accordion-group').each ->
    
    
    accordion_events($(this))
    
    ###
    
    $(document).on "click", $(this), ->
      $(this).toggleClass "icon-plus icon-minus"
      return
    
    accordion_events($(this), $(this).parent())
    
    console.log($(this).parents().find('')
  
  
  $("#identifiers, #affiliations, #addresses, #descriptions, #keywords, #awards, #notes, #funding_agent_names").each ->
    
    zone = $(this)
    sing = $(this).attr("data-singular-name")
  
    $(this).find("fieldset:first").each ->
      
      uid2 = s4()
      json = eval(
        title: sing + " " + parseInt($(this).find(".accordion-group").size() + 1)
        content: $(this).html()
        uid: s4()
        uid2: uid2
      )
      accordion = $(JST["templates/accordion"](json))
      $(document).on "click", "a[href='#" + uid2 + "']", ->
        $(this).toggleClass "icon-plus icon-minus"
        return

      $(this).parent().append accordion
      
      accordion_events(accordion, zone)
      $(this).remove()
      return
    ###

accordion_events = (accordion, from="db") ->

  #check_hidden_assoc(zone, ".accordion-group")
  
  accordion.find(".delete-accordion").click(->
    
    button = $(this)
    
    accordion.find('.cancel').remove()
    
    
    if $(this).hasClass("delete-accordion")
      accordion.find('i[class="add-on"]').remove
      
      accordion.find("input[data-name='rec_delete']").val('true')
        
      if from != "js"
      
  
        $(this).parent().find('a:first').after(
          $('<i class="add-on cancel" style="position:absolute; top:8px;right:50px;text-decoration:none;cursor:pointer">'+I18n.t('js.cancel_suppression')+'</i>').click ->
            accordion.find("input[data-name='rec_delete']").val('false')
            accordion.find('span').css('text-decoration', 'none')
            $(this).remove()
            
            button.disabled = false
            
        )
      
        accordion.find('span').css('text-decoration', 'line-through')
        
        button.disabled = true
      else
       accordion.remove()
        
        
        #check_hidden_assoc(zone, ".accordion-group")
      return       
       
    ).hover (->
      $(this).css('color', 'red')
      
      return
    ), ->
      $(this).css('color', 'black')
      return
  
  $(document).on 'hidden.bs.collapse', accordion, ->
   
    return
                           
  $(document).on 'shown.bs.collapse', accordion, ->
   
    return
    


edit_modal = (bs_modal) ->
  

  bs_modal = bs_modal.modal({ keyboard: false, show: true })
  
  bs_modal.find('button.cancel').remove()
  
  
  
  bs_modal.find("span[data-toggle=\"tooltip\"]").popover({trigger:"hover", title:I18n.t('help'),container:'body'})
  
  
  
  bs_modal.find("button.save").unbind("click").click ->

    
    bs_modal.modal "hide"
     
    
    

launch_modal = (insert_zone, object, rec_class) ->
  
  
  sing_name = insert_zone.attr('data-singular-name')
  
  json = eval({title: rec_class, content:object})

  bs_modal = $(JST["templates/modal"](json))
  $('body').append(bs_modal)

  bs_modal = bs_modal.modal({ keyboard: false, show: true })
  
  bs_modal.find("span[data-toggle=\"tooltip\"]").popover({trigger:"hover", title:I18n.t('help'),container:'body'})

  uid1 = s4()
  uid2 = s4()
  uid3 = s4()
  bs_modal.find("button.save").unbind("click").click ->
   
    
    if $('#temp_form_id').length == 0
      bs_modal.wrap "<form id=\"temp_form_id\" />"
    
    
    
    ###
    $("#temp_form_id").validate
  
      ignore:'.ignore'
  
      showErrors: (errorMap, errorList) ->
        $.each @validElements(), (index, element) ->
          $element = undefined
          $element = $(element)
          $element.parent().find('label.error').remove()

          return
    
        $.each errorList, (index, error) ->
          $element = undefined
          $element = $(error.element)
          
          
          console.log($element)
          
          $element.parent().find('label.error').remove()
          
      
          error = $("<label class=\"error\"><span class=\"add-on\" data-toggle=\"tooltip\" data-placement=\"right\" title=\""+error.message+"\"><i style=\"color:red\" data-toggle=\"tooltip\" class=\"fa fa-exclamation-triangle\" title=\"tooltip\" ></i></label>")
          error.find('span').tooltip({placement:'top', container:"body"})
          
          if $element.hasClass("hidden-association")
            $element.parent().find('.input-append').append(error)
          else
            $element.parent().append(error)
          
          return
    
    isValid = jQuery("#temp_form_id").valid()
    ###
    if isValid = true
      

      bs_modal.unwrap()
      bs_modal.modal "hide"
      
      insert_zone.append $("<div/>").css("display", "none").attr("id", uid1).append(bs_modal.find('select, input, textarea').clone())
      
      
      #insert_zone.append $("<div/>").css("display", "none").attr("id", uid1).append(bs_modal.html())
      
      json = eval({
        title:I18n.t("js.popup.new").capitalize() + " " + sing_name, 
        label_link:bs_modal.find('input:first').val(), 
        uid2:uid2})
      
      box_tpl = $(JST["templates/edit-box"](json))



      $(document).on "click", "#" + uid2 + " button.edit", ->
        bs_modal.modal "show"
 
        bs_modal.find("button.save, button.cancel").unbind("click").click ->
          bs_modal.modal "hide"


      $(document).on "click", "#" + uid2 + " button.delete", ->
        
        $("#" + uid2).remove()
        $("#" + uid1).remove()
        
        #$("#" + uid2).wrap('<del/>')
        
        #check_hidden_assoc(insert_zone, ".edit-box")
        
        

      insert_zone.find('label.error').remove()
      
      insert_zone.find('.container-edit-box').prepend box_tpl.show()
      
      #check_hidden_assoc(insert_zone, ".edit-box")
      

      
    

  bs_modal.find("button.cancel").unbind("click").click ->
    bs_modal.modal "hide"
    false


  

$(document).ready ->
  

  $('.edit-box').each ->
    
    id = $(this).attr('id')
    insert_zone = $('#'+$('#content-'+id).attr('data-insert-zone'))
    

    sing = $('#content-'+id).attr('data-singular-name')
    bs_modal = $('#content-'+id)
    
    box = $(this)
    
    $(this).find('button.edit').click ->
      edit_modal(bs_modal)
      box.find('input[type="hidden"]').val('true')   
    $(this).find('button.delete').click ->
      bs_modal.find("input[data-name='rec_delete']").val('true')
      
      $(this).parent().append(
        $('<i class="add-on" style="text-decoration:none;cursor:pointer">'+I18n.t('js.cancel_suppression')+'</i>').click ->
          bs_modal.find("input[data-name='rec_delete']").val('false')
          box.find('span').css('text-decoration', 'none')
          $(this).remove()
      )
      
      box.find('span').css('text-decoration', 'line-through')
      

  person_type = ""    
  
  initialize_accordions()
  
  current_popup = ""
  $("span[data-toggle=\"tooltip\"]").popover({trigger:"hover", title:I18n.t('help'), container:'body'})
  $(".add_fields").hide()
  $(document.body).on "click", " #add-depositors, #add-distributors, #add-authors, #add-copyright_holders, #add-interviewers, #add-interviewers_unknowns, #add-editors, #add-contacts", ->

    className = $(this).attr("id").replace("add-", "")
    zone = $('#'+className)
    
   
    
    $(".choose_person").unbind().click ->
      person_type='person'
      zone.find("a[data-associations='"+className+"']").trigger "click", ['person']
      return false
        
      return

    $(".choose_orgunit").unbind().click ->
      person_type='orgunit'
      zone.find("a[data-associations='"+className+"']").trigger "click", ['orgunit']
      return false
      return
    
    
    
    return

  $(document.body).on "click", "#add-persons, #add-orgunits, div#add-funding_agent_names, #add-identifiers, #add-affiliations, #add-addresses, #add-descriptions, #add-keywords, #add-awards, #add-projects, #add-funding_agent_names, #add-notes", ->
   className = $(this).attr("id")
   $("a[data-associations='" + className.replace("add-", "") + "']").trigger "click"

  $(document.body).on("cocoon:after-insert", "div#interviewers_unknowns, div#depositors, div#distributors, div#authors, div#copyright_holders, div#interviewers, div#editors, div#projects, div#contacts", (e, parent_object, type) ->
    alert($(this).attr('id'))  
    insert_zone = $(this)
    className = $(this).attr("id")
    agent_rec = parent_object.find('input[type="hidden"]')

    changed_parent_object =  $(parent_object.find('a[data-association="'+person_type+'"]').attr('data-association-insertion-template')).append(agent_rec)
    
    if(className != 'projects')
      html = changed_parent_object.html()
    else
      html = parent_object.html()
    
    bs_modal = launch_modal(insert_zone, html, $(this).attr('data-plural-name') )
    
    current_popup = bs_modal
    parent_object.remove()
    return
  ).on("cocoon:before-remove", ->
    $("#owner_from_list").show()
    $("#owner a.add_fields").show()
    return
  ).on "cocoon:after-remove", ->

  $("#tasks").on("cocoon:before-insert", (e, task_to_be_added) ->
    task_to_be_added.fadeIn "slow"
    return
  ).on("cocoon:after-insert", (e, added_task) ->
    added_task.css "background", "red"
    return
  ).on "cocoon:before-remove", (e, task) ->
    $(this).data "remove-timeout", 1000
    task.fadeOut "slow"
    return

  $(document.body).on "cocoon:after-insert", "div#persons, div#orgunits, div#funding_agent_names, div#affiliations, div#keywords, div#awards, div#descriptions, div#addresses, div#identifiers, div#funding_agent_name, div#notes", (e, parent_object) ->
    uid2 = s4()
    parent_object.remove()
    json = eval(
      title: 'New '+$(this).attr("data-singular-name")
      content: parent_object.html()
      uid: s4()
      redux_link: I18n.t("redux")
      uid2: uid2
      uid_accordion:$(this).find('.accordion-container').attr('id')
    )
    accordion = $(JST["templates/accordion"](json))
    

    $(this).find('.accordion-container').prepend accordion.fadeIn 300
    
    
    
    accordion.find('a:first').trigger "click"
    
    accordion_events(accordion, from="js")
    
  
  return
                                
jQuery ($) ->                        
  
   
  
   
  $('#nav-tabs a:last').tab('show');
  
  
  #$('select[multiple="multiple"]').multiselect( {enableFiltering: true,maxHeight: 400},  onChange: (element, checked) ->);
  
  handler = (e) ->
    jqEl = $(e.currentTarget)
    tag = jqEl.parent()
 
    switch jqEl.attr("data-action")
      when "add-single"
        clone = tag.clone().css("display", "block")
        
        clone.find("button, span.add-on").remove()
        clone.find("input[type='text']").val ""
        clone.find("textarea").text ""
        #clone.find("label").remove()
        clone.append "<button data-action=\"delete\" class=\"delete btn btn-medium\" ><i class=\"icon-minus\"></i></button>"
          
          
        tag.parent().append clone.fadeIn 300
      when "delete"
        tag.slideUp 300, ->
          tag.remove()
    false

  multiTags = $("form")
  $(document).on "click", "button[data-action=add-single], button[data-action=delete] ", handler
  
  
  
  ###
  $("form.simple_form").validate
  
    ignore:'.ignore'

    showErrors: (errorMap, errorList) ->
      $.each @validElements(), (index, element) ->
        $element = undefined
        $element = $(element)
        $element.data("title", "").removeClass("error").tooltip "destroy"

        
        
        
        $element.parent().find('label.error').remove()
        return
  
      $.each errorList, (index, error) ->
        $element = undefined
        $element = $(error.element)
        
        
        $element.parent().find('label.error').remove()
        
    
        error = $("<label class=\"error\"><span class=\"add-on\" data-toggle=\"tooltip\" data-placement=\"right\" title=\""+error.message+"\"><i style=\"color:red\" data-toggle=\"tooltip\" class=\"fa fa-exclamation-triangle\" title=\"tooltip\" ></i></label>")
        error.find('span').tooltip({placement:'top', container:"body"})
        
        if $element.hasClass("hidden-association")
          $element.parent().find('.input-append').append(error)
        else if $element.attr("type") == 'checkbox'
        
          $element.closest('.control-group').find('.control-label').append(error)
          console.log($element.parents())
          
        else 
          $element.parent().append(error)
        
          
 
        
        return
        
        
        #$element.tooltip("destroy").data("title", error.message).addClass("error").tooltip()
        return

 ### 

