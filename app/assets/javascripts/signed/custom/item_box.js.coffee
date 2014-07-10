jQuery ($) ->
  $('.dotted').dotdotdot(
    ellipsis: '... ',
    height:100
  )
  $('.item-description').hide()

  $(document).on('mouseenter', '.item-box', () ->
    $(this).find('.action-bar').slideDown('fast')
    $(this).find('.item-description').slideDown('fast')
  )

  $(document).on('mouseleave', '.item-box', () ->
    $(this).find('.action-bar').slideUp('fast')
    $(this).find('.item-description').slideUp('fast')
  )

  $(document).on('mouseenter', '.select-image', () ->
    url = $(this).data('src')
    current_url = $('.show-image').attr('src')
    unless url == current_url
      $('.show-image').attr('src', url)
      $(".show-image").elevateZoom({constrainSize:274, zoomType: "lens"})
  )

  $(".show-image").elevateZoom({constrainSize:274, zoomType: "lens"})

