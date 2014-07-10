@item_selection = ($) ->
  input = $('input[id="trade_counter_value_trade_items"]')
  input.attr('value', undefined)

  $(document).on('click', '.mark-interest', () ->
    id = $(this).attr('id')
    item_box = $('.item-box[id="' + id + '"]')
    item_box.addClass('marked')
    cur_val = input.attr('value')
    if cur_val == undefined
      value = [id]
    else
      value = (cur_val + ',' + id).split(',')
    input.attr('value', value)
    console.log input.attr('value')
    item_box.find('.unmark-interest').show()
    $(this).hide()

  )
  $(document).on('click', '.unmark-interest', () ->
    id = $(this).attr('id')
    item_box = $('.item-box[id="' + id + '"]')
    item_box.removeClass('marked')
    item_box.find('.mark-interest').show()
    $(this).hide()
    value = input.attr('value').split(',')
    $.each(value, (idx, val) ->
      if val == id
        value.splice(idx,1)
    )
    input.attr('value', value)
    console.log input.attr('value')
  )
