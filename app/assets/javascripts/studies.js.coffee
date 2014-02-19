$(document).ready ->

  $('button[data-toggle="tooltip"]').tooltip()
  
  className = undefined
  insert_zone = undefined
  $(".add_fields").hide()
  $(document.body).on "click", ".add-depositors, .add-distributors, .add-authors, .add-copyright_holders, .add-interviewers, .add-editors, .add-contacts", ->
    className = $(this).attr("class")
    $(".choose").dialog
      open: ->
        $('.ui-dialog-content input:visible').css('z-index',9999); 
      title:'choose'
      height: 140
      modal: true
      width: "auto"
      appendTo: "form"
      buttons:
        person: ->
          $(this).dialog "close"
          $("a[data-associations='person_" + className.replace("add-", "") + "']").trigger "click"
          return

        orgunit: ->
          $(this).dialog "close"
          $("a[data-associations='orgunit_" + className.replace("add-", "") + "']").trigger "click"
          return

    return
    
    
  $(document.body).on "click", ".add-identifiers, .add-affiliations, .add-addresses, .add-descriptions, .add-keywords", ->
    className = $(this).attr("class")
      
    console.log($("a[data-associations='" + className.replace("add-", "") + "']"))
    $("a[data-associations='" + className.replace("add-", "") + "']").trigger "click"
    
  
  $(document.body).on("cocoon:after-insert", "div#keywords, div#descriptions ,div#depositors, div#distributors, div#authors, div#copyright_holders, div#interviewers, div#editors, div#affiliations, div#addresses, div#identifiers", (e, parent_object) ->

    insert_zone = $(this)
    
    
    className = $(this).attr("id")
    parent_object.dialog
      open: ->
        $('.ui-dialog-content input:visible').css('z-index',9999);
      title:'Create a '+className.slice(0, -1)
      modal: true
      width: "auto"
      minHeight: "auto"
      height: "auto"
      appendTo: "form.simple_form"
      buttons:
        save: ->
          
          elements = parent_object.find('input,textarea,select').attr('required',true)
          
          if(elements.valid())

            str = parent_object.find("textarea").val()
            if str.length > 10
              t_a = parent_object.find("textarea").val().substring(0, 10)
            else
              t_a = str
            label_link = ' lang : '+ parent_object.find('#language option:selected').text() + ' text : ' +t_a+"...";
            
            tpl = 
            $('<div/>',
                class: "control-group input-append"
                type: "button"
                style:"display:block").append(
              $("<button/>",
                class: "btn btn-default btn-lg edit"
                type: "button"
                'data-toggle':'edit'
              ).append($("<span/>",
                class: "glyphicon glyphicon-star"
                text: label_link
              )).on("click", ->
                #link = $("<br/><a class='edit'>" + className.slice(0, -1) + parseInt($('div#'+className+' a[class="edit"]').length+1)+"</a>").on("click", ->
                parent_object.dialog
                  open: ->
                    $('.ui-dialog-content input:visible').css('z-index',9999);          
                  
                  title:'Edit the '+className.slice(0, -1)
                  modal: true
                  width: "auto"
                  minHeight: "auto"
                  height: "auto"
                  appendTo: "form.simple_form"
                  buttons:
                    save: ->
                      $(this).dialog "close"
                      return
    
                return
              )
              
              
             ).append(
             
               $("<button/>",
                  class: "add btn btn-medium"
                  type: "button"
                ).append("<i class=\"icon-remove\"></i>").click(->
                  
                  $("#dialog-confirm").dialog
                    resizable: false
                    height: 200
                    modal: true
                    buttons:
                      "Delete all items": ->
                         parent_object.remove()    
                         tpl.remove() 
                         $(this).dialog "close"
                         return
                  
                      Cancel: ->
                        $(this).dialog "close"
                        return
                  
                 
                  
                            
                  return
                )
                                
              )
  
            
           
            $(this).dialog "close"
            insert_zone.append tpl
            
         cancel: ->
           $(this).dialog "close"
         
          

    parent_object.on "cocoon:after-insert", "div.affiliations", (e, sub_object) ->
   
      sub_insert_zone = parent_object.find(".affiliations")
      console.log sub_insert_zone
      sub_className = $(this).attr("class")
      sub_object.dialog
        open: ->
          $('.ui-dialog-content input:visible').css('z-index',9999);        
        title:'Create a '+sub_className.slice(0, -1)
        modal: true
        width: "auto"
        minHeight: "auto"
        height: "auto"
        appendTo: "form.simple_form form-vertical"
        buttons:
          save: ->
            
            elements = sub_object.find('input,textarea,select').attr('required',true)
          
            if(elements.valid())
            
              link = $("</br><a class='edit'>" + sub_className.slice(0, -1) + parseInt($('div#'+sub_className+' a[class="edit"]').length+1)+"</a>").on("click", ->
                sub_object.dialog
                  open: ->
                    $('.ui-dialog-content input:visible').css('z-index',9999);               
                  title:'Edit the '+sub_className.slice(0, -1)
                  modal: true
                  width: "auto"
                  minHeight: "auto"
                  height: "auto"
                  appendTo: "form.simple_form form-vertical"
                  buttons:
                    save: ->
                      $(this).dialog "close"
                      return
                    cancel: ->
                      $(this).dialog "close"
                      return
  
                return
              )
              sub_insert_zone.append link
              $(this).dialog "close"
              return
         cancel: ->
           $(this).dialog "close"

      return

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

  return

jQuery ($) ->
  handler = undefined
  multiTags = undefined
  handler = undefined
  multiTags = undefined
  handler = (e) ->
    clone = undefined
    jqEl = undefined
    tag = undefined
    clone = undefined
    jqEl = undefined
    tag = undefined
    jqEl = $(e.currentTarget)
    tag = jqEl.parent()
    console.log tag
    switch jqEl.attr("data-action")
      when "add"
        clone = tag.clone().css("display", "block")
        clone.find("button").remove()
        clone.find("input").val ""
        clone.find("label").remove()
        clone.append "<button data-action=\"delete\" class=\"delete btn btn-medium\" ><i class=\"icon-minus\"></i></button>"
        tag.parent().append clone
      when "delete"
        tag.remove()
    false

  multiTags = $("form")
  $(document).on "click", "button[data-action=add], button[data-action=delete] ", handler
  $("#study_data_collection_date_begin, #study_data_collection_date_end, #study_edition_last_date, #study_edition_first_date, #study_documents_date_begin, #study_documents_date_end").datepicker
    changeMonth: true
    changeYear: true

  $("#study_coverage_temporal_end").datepicker
    dateFormat: "yy"
    changeMonth: false
    changeDay: false
    changeYear: true
  
  
   
   
   $("#new_study").validate
      invalidHandler: (event, validator) ->
        
        # 'this' refers to the form
        errors = validator.numberOfInvalids()
        if errors
          message = (if errors is 1 then "You missed 1 field. It has been highlighted" else "You missed " + errors + " fields. They have been highlighted")
          $("div.error span").html message
          $("div.error").show()
        else
          $("div.error").hide()
        return
    
      errorPlacement: (error, element) ->
        
        error.insertAfter element.parent()
        return
  
  
  
  $('#button_submit').on("click", ->
   

  )
  
  return
