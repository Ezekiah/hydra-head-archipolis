
String::capitalize = ->
  @charAt(0).toUpperCase() + @slice(1)

s4 = ->
  Math.floor((1 + Math.random()) * 0x10004425470).toString(16).substring 1

initialize_accordions = undefined
initialize_accordions = ->
  $("#identifiers, #affiliations, #addresses, #descriptions, #keywords, #awards").each ->
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
      
      accordion_events(accordion)
      
      $(this).parent().append accordion
      $(this).remove()
      return
    

accordion_events = (accordion) ->
  
  console.log(accordion)
  
  accordion.find(".delete-accordion, .reduce-accordion").click(->
    if $(this).hasClass("delete-accordion")
      accordion.slideUp 300, ->
        $(this).remove()
        return       
       
    ).hover (->
      $(this).toggleClass "icon-white"
      
      return
    ), ->
      $(this).toggleClass "icon-white"
      return
  

launch_modal = (insert_zone, object, rec_class) ->
  
  
  
  sing_name = insert_zone.attr('data-singular-name')
  
  
  json = eval({title:I18n.t("js.popup.new").capitalize() + " " + I18n.t("js.popup." + rec_class), content:object})

  bs_modal = $(JST["templates/modal"](json))

  bs_modal = bs_modal.modal({ keyboard: false, show: true })
  
  bs_modal.find("span[data-toggle=\"tooltip\"]").popover()
  

  uid1 = s4()
  uid2 = s4()
  uid3 = s4()
  bs_modal.find("button.save").unbind("click").click ->
    
    
    $("#new_study").validate debug: true
    bs_modal.wrap "<form id=\"temp_form_id\" />"
    isValid = jQuery("#temp_form_id").valid()
    bs_modal.unwrap()
    if isValid = true
      bs_modal.modal "hide"
      
      insert_zone.append $("<div/>").css("display", "none").attr("id", uid1).append(bs_modal.find('select, input, textarea').clone())
      
      
      #insert_zone.append $("<div/>").css("display", "none").attr("id", uid1).append(bs_modal.html())
      
      json = eval({
        title:I18n.t("js.popup.new").capitalize() + " " + sing_name, 
        label_link:sing_name + ' ' +parseInt(insert_zone.find(".edit-box").size() + 1), 
        uid2:uid2})
      
      box_tpl = $(JST["templates/edit-box"](json))



      $(document).on "click", "#" + uid2 + " button.edit", ->
        bs_modal.modal "show"
        bs_modal.find("button.save, button.cancel").unbind("click").click ->
          bs_modal.modal "hide"


      $(document).on "click", "#" + uid2 + " button.delete", ->
        $("#" + uid2).remove()
        $("#" + uid1).remove()

      insert_zone.append box_tpl.show()
    bs_modal.find("button.cancel").unbind().click ->
      bs_modal.modal "hide"

    bs_modal.on "hidden.bs.modal", ->


  bs_modal.find("button.cancel").unbind("click").click ->
    bs_modal.modal "hide"

  

$(document).ready ->
  
  initialize_accordions()
  
  current_popup = ""
  $("span[data-toggle=\"tooltip\"]").popover({trigger:"hover", title:I18n.t('help')})
  $(".add_fields").hide()
  $(document.body).on "click", "#add-depositors, #add-distributors, #add-authors, #add-copyright_holders, #add-interviewers, #add-editors, #add-contacts", ->

    className = undefined
    className = $(this).attr("id").replace("add-", "")
    
    
    $(".choose_person").unbind().click ->
      $("a[data-associations='person_" + className.replace("add-", "") + "']").trigger "click"
      return false
        
      return

    $(".choose_orgunit").unbind().click ->
      $("a[data-associations='orgunit_" + className.replace("add-", "") + "']").trigger "click"
      return false
      return
    
    
    
    return

  $(document.body).on "click", "#add-identifiers, #add-affiliations, #add-addresses, #add-descriptions, #add-keywords, #add-awards, #add-projects, #add-funding_agent_names", ->
   className = $(this).attr("id")
   $("a[data-associations='" + className.replace("add-", "") + "']").trigger "click"

  $(document.body).on("cocoon:after-insert", "div#depositors, div#distributors, div#authors, div#copyright_holders, div#interviewers, div#editors, div#projects, div#contacts", (e, parent_object) ->
    
    
    
    insert_zone = $(this)
    className = $(this).attr("id")
    
    
    bs_modal = launch_modal(insert_zone, parent_object.html(), parent_object.find("input[type=\"hidden\"]").val().toLowerCase())
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

  $(document.body).on "cocoon:after-insert", "div#affiliations, div#keywords, div#awards, div#descriptions, div#addresses, div#identifiers, div#funding_agent_name", (e, parent_object) ->
    uid2 = s4()
    parent_object.remove()
    json = eval(
      title: $(this).attr("id") + " " + parseInt($(this).find(".accordion-group").size() + 1)
      content: parent_object.html()
      uid: s4()
      redux_link: I18n.t("redux")
      uid2: uid2
    )
    accordion = $("<div/>").append(JST["templates/accordion"](json))
    $(this).append accordion.fadeIn 300
    
    accordion_events(accordion)
    
  
  return

jQuery ($) ->
  
  $('select[multiple="multiple"]').multiselect();
  
  handler = (e) ->

    jqEl = $(e.currentTarget)
    tag = jqEl.parent()
    
    console.log(tag.find('input'))
    
    switch jqEl.attr("data-action")
      when "add-single"
        clone = tag.clone().css("display", "block")
        
        
        
        clone.find("button").remove()
        clone.find("input[type='text']").val ""
        #clone.find("label").remove()
        clone.append "<button data-action=\"delete\" class=\"delete btn btn-medium\" ><i class=\"icon-minus\"></i></button>"
          
        console.log(clone.html())
          
        tag.parent().append clone.fadeIn 300
      when "delete"
        tag.slideUp 300, ->
          tag.remove()
    false

  multiTags = $("form")
  $(document).on "click", "button[data-action=add-single], button[data-action=delete] ", handler
  
  
  $("#new_study").validate
    invalidHandler: (event, validator) ->
      errors = validator.numberOfInvalids()
      if errors
        message = ((if errors is 1 then "You missed 1 field. It has been highlighted" else "You missed " + errors + " fields. They have been highlighted"))
        $("div.error span").html message
        $("div.error").show()
      else
        $("div.error").hide()
      return

    errorPlacement: (error, element) ->
      error.insertAfter element.parent()
      return

  $("#button_submit").on "click", ->

  return
