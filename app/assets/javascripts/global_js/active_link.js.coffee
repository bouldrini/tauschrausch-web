jQuery ($) ->
  cur_path = window.location.pathname
  nav_links = $('#tauschrausch-navbar').find('a')
  nav_links.each (index, obj) ->
    href = $(this).attr('href');
    if href == cur_path
      $(this).parents('li').addClass('active')
