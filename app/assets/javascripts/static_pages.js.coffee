# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  # Variables
  $document = $(document)
  $contactBt = $("#contact_buttons")
  $contactSection = $('#contact')

  # Get rid of flash messages
  $("a.close").on("click", ->
    $(this).closest(".alert").clearQueue().slideUp()
  ).closest(".alert").delay(4000).slideUp()

  # Initiate parallax
  $.stellar()

  # Open and close contact section
  $("#contact").swipe {
    swipe: (event, direction, distance, duration, fingerCount)->
      coverage = distance / $(event.currentTarget).width() >= 0.7
      if coverage and direction == "right"
        $contactSection.removeClass('active')
  }
  $("a[href='#']").on 'click', (e)->
    e.preventDefault()
    $contactSection.removeClass('active')
  $("a[href='#contact']").on 'click', (e)->
    e.preventDefault()
    $contactSection.addClass('active')

  # Back to Top
  $('body').append "<a href='#' class='back-to-top'><span class='arrow'></a>"
  # SMOOTH SCROLL
  jQuery(".back-to-top").on 'click', (e) ->
    jQuery('html,body', document).animate({scrollTop:0}, 300)
  # Control if back-to-top appear
  contactOffset = $contactBt.offset().top - 10
  $document.on 'scroll', ->
    # Fix contact button
    if $document.scrollTop() >= contactOffset
      $contactBt.addClass('fixed')
    # Unfix contact button
    else
      $contactBt.removeClass('fixed')
    # Show Back to top button
    if $document.scrollTop() >= 280
      jQuery(".back-to-top").addClass('appear')
      # Hide Back to top button
    else
      jQuery(".back-to-top").removeClass('appear')

  # Putting Graphics in the Homepage
  $(".project_chart").each((i,chart)->
    context = chart.getContext("2d")
    dataLabels = $(chart).data('labels').split(',')
    dataValues = $(chart).data('values').split(',')
    if dataValues.length > 1 and dataLabels.length > 1
      data = {
        labels : dataLabels
        datasets : [
          {
            fillColor : "rgba(151,187,205,0.5)"
            strokeColor : "rgba(151,187,205,1)"
            pointColor : "rgba(151,187,205,1)"
            pointStrokeColor : "#fff"
            data : dataValues
          }
        ]
      }
      c = new Chart(context).Radar(data);
  )