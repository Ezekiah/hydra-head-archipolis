



$(document).ready ->
  $(".add_fields").hide()
  insert_zone = undefined
  className = undefined
  $(".add-depositors, .add-distributors, .add-authors, .add-copyright-holders, .add-interviewers, .add-editors, .add-contacts").on "click", ->
    className = $(this).attr("class")
    $(".choose").dialog
      height: 140
      modal: true
      width: "auto"
      appendTo: "form#new_study"
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

  $("div#depositors, div#distributors, div#authors, div#copyright-holders, div#interviewers, div#editors").on("cocoon:before-insert", (e, object) ->
  ).on("cocoon:after-insert", (e, parent_object) ->
    insert_zone = $(this)
    className = $(this).attr("id")
    
    parent_object.dialog
      modal: true
      width: "auto"
      minHeight: "auto"
      height: "auto"
      appendTo: "form#new_study"
      buttons:
        save: ->
          
          link = $("<a>" + className + "</a><br/>").on("click", ->
            parent_object.dialog
              modal: true
              width: "auto"
              minHeight: "auto"
              height: "auto"
              appendTo: "form#new_study"
              buttons:
                save: ->
                  $(this).dialog "close"
                  return

            return
          )
          $(this).dialog "close"
          insert_zone.append link
          #insert_zone.append parent_object.css('display', 'none')
          
         
          
          return

    parent_object.on "cocoon:after-insert", "div.affiliations", (e, sub_object) ->
      sub_insert_zone = parent_object.find(".affiliations")
      console.log sub_insert_zone
      sub_className = $(this).attr("class")
      sub_object.dialog
        modal: true
        width: "auto"
        minHeight: "auto"
        height: "auto"
        appendTo: "form#new_study"
        buttons:
          save: ->
            link = $("<a>" + sub_className + "</a><br/>").on("click", ->
              sub_object.dialog
                modal: true
                width: "auto"
                minHeight: "auto"
                height: "auto"
                appendTo: "form#new_study"
                buttons:
                  save: ->
                    $(this).dialog "close"
                    return

              return
            )
            
            sub_insert_zone.append link
            #sub_insert_zone.append sub_object
            
            
            $(this).dialog "close"
            
            return

      return

    return
  ).on("cocoon:before-remove", ->
    $("#owner_from_list").show()
    $("#owner a.add_fields").show()
    return
  ).on "cocoon:after-remove", ->

  
  # e.g. recalculate order of child items 
  
  # example showing manipulating the inserted/removed item
  
  # e.g. set the background of inserted task
  $("#tasks").on("cocoon:before-insert", (e, task_to_be_added) ->
    task_to_be_added.fadeIn "slow"
    return
  ).on("cocoon:after-insert", (e, added_task) ->
    added_task.css "background", "red"
    return
  ).on "cocoon:before-remove", (e, task) ->
    
    # allow some time for the animation to complete
    $(this).data "remove-timeout", 1000
    task.fadeOut "slow"
    return

  return



jQuery ($) ->
  handler = (e) ->
    
    # get the element who trigged the event
    jqEl = $(e.currentTarget)
    
    # get his parent div
    tag = jqEl.parent()
    console.log tag
    
    # check which action we should perform
    switch jqEl.attr("data-action")
      when "add"
        
        # clone the tag (div), reset his input text field
        # and place the new tag after the current one
        
        
        clone = tag.clone()
        
        
        clone.find('button').remove()
        clone.find('input').val('')
        clone.find('label').remove()
        
        
        clone.append('<button data-action="delete" class="delete btn btn-small" ><i class="icon-minus"></i></button>')
        
        tag.after clone
        
        
        
      when "delete"
        
        # remove the element
        tag.remove()
    false
  multiTags = $("form")
  $(document).on "click", "button[data-action=add], button[data-action=delete] ", handler
  
  $( "#study_data_collection_date_begin, #study_data_collection_date_end, #study_edition_last_date, #study_edition_first_date, #study_documents_date_begin, #study_documents_date_end" ).datepicker( changeMonth: true,  changeYear: true)
  $('#study_coverage_temporal_end').datepicker(  dateFormat: 'yy', changeMonth: false, changeDay: false, changeYear: true)
  
  
  return
