hide_success = (e)->
  e.preventDefault()
  $('#order_form .bg-success').addClass('hidden')
  $('#order_form .form-group').removeClass('hidden')
  return

success_result = (data) ->
  $('#order_form .error_message').empty()
  $('#order_form .warning').empty()
  $('#order_form .submit').removeAttr('disabled')
  $('#order_form .form-group').addClass('hidden')
  $('#order_form .bg-success').removeClass('hidden')
  $('#order_form').get(0).reset()
  return

error_result = (xhr) ->
  errors = JSON.parse(xhr.responseText).errors
  $('#order_form .bg-success').addClass('hidden')
  $('#order_form .error_message').empty()
  $('#order_form .warning').empty()
  $('#order_form .submit').removeAttr('disabled')

  if typeof errors != 'undefined'
    for field, mess of errors
      elem = $('#order_' + field)
      elem.next('.error_message').html(mess[0])
      elem.parents('.form-group').find('.warning').text('!')

  return


submit_form = (e) ->
  e.preventDefault()
  $('#order_form .submit').attr('disabled', true)
  data = $(this).serialize()
  $.ajax
    url: '/orders.json',
    type: 'POST',
    data: data,
    dataType: 'json',
    success: success_result,
    error: error_result
  return

order_form = ->
  $('#order_form').submit submit_form
  $('#order_form #order_button_success').click hide_success
  return

$(document).ready order_form
$(document).on 'page:load', order_form