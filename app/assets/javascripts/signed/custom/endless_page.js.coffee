@endless_page = ($) ->
  currentPage = 1

  pageHeight = () ->
    Math.max(document.body.scrollHeight, document.body.offsetHeight)

  scrollDistanceFromBottom = () ->
    pageHeight() - (window.pageYOffset + self.innerHeight);

  nearBottomOfPage = () ->
    scrollDistanceFromBottom() < 150;

  checkScroll = () ->
    if nearBottomOfPage()
      currentPage++
      $('.loading').show()
      $.ajax('/market?page=' + currentPage, {
        async: true,
        method: 'GET',
        success: (data) ->
          partial = $(data.partial)
          partial.insertAfter($('.item-row:last-child'))
          $('.loading').hide()

          $('.item-description').show()
          $('.dotted').dotdotdot(
            ellipsis: '... ',
            height:100
          )
          $('.item-description').hide()
          console.log 'done'
          if data.partial != ""
            setTimeout ( ->
              checkScroll()
            ), 250
      })
    else
      setTimeout ( ->
        checkScroll()
      ), 250

  document.observe('dom:loaded', checkScroll);
