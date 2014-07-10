jQuery ($) ->
  initialize_bootstrap_datetimepicker = () ->
    $('.bootstrap-datetimepicker').datetimepicker
      language: 'de',
      minuteStepping: 15

    $('.bootstrap-datepicker').datetimepicker
      language: 'de',
      pickTime: false

    $('.bootstrap-timepicker').datetimepicker({
      language: 'de',
      pickDate: false,
      pickTime: true,
      minuteStepping: 15,
      format: 'HH:mm',
      pick12HourFormat: false
    });

  initialize_chosen = () ->
    input = $('.chosen')
    # $(document).on('nested:fieldAdded', (event) ->
    #   $('.chosen').chosen
    #     allow_single_deselect: true,
    #     no_results_text: 'Keine Einträge gefunden',
    #     width: '100%'
    # )

    input.chosen
      no_results_text: 'Keine Einträge gefunden',
      width: '100%'

  initialize_wysihtml5 = () ->
    textareas = $('.editor')
    $.each(textareas, (index, obj) ->
      $(obj).wysihtml5();
    )

  initialize = () ->
    initialize_bootstrap_datetimepicker()
    initialize_chosen()
    initialize_wysihtml5()

  initialize()
