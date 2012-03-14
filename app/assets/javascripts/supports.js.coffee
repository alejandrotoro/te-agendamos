# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  #loading_box = $("<div class='loader' align='center'><img src='/assets/ui/ajax-loader.gif'/></div>")

  $("#send-message").live 'click', (event) ->
    event.preventDefault()
    $.ajax 
      data: "_method=POST&name=" + $("#name-field").val() + "&email=" + $("#email-field").val() + "&comment=" + $("#comment-field").val()
      type: "POST"
      url: $(this).attr('href')
      dataType: 'json'
      beforeSend: ->
        #loading_box.dialog({ title: '', modal: true, closeOnEscape: false, height: 70, width: 60})
      success: (data) ->
        console.log data
        $('#response-message').jGrowl(data.notice)
        $('#response-message').removeClass("hidden")
      complete: ->
        #loading_box.dialog 'close'
    false