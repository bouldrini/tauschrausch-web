jQuery ($) ->
  $(document).on('click', '.slide-out-profile-button', () ->
    menu = $('.profile-slide-menu')
    $(this).css('visibility', 'hidden')
    $('body').addClass('no-scroll')
    menu.animate({
      left: "0"
    },500)
  )
  $(document).on('click', '.slide-in-profile-button', () ->
    menu = $('.profile-slide-menu')
    $('body').removeClass('no-scroll')
    menu.animate({
      left: "-100%"
    },500)
    $('.slide-out-profile-button').css('visibility', 'visible')
  )
