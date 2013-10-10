# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("a[rel=tooltip]").tooltip({placement: 'bottom'})
  $("a.close").on "click", ->
    $(this).closest(".alert").fadeOut()

  $folio_container = $ ".portfolio-list"
  $tagsList = $('.tags-list')
  # Initializes the Shuffler
  $folio_container.shuffle({itemSelector: '.portfolio_item'})
  # When user clics the tag list or selects from the select field, it calls the sortFolio function
  $(".tag-item a", $tagsList).on "click", ->
    sortFolio $(@).attr('rel')
  sortFolio = (selected)->
    # Sorts the portfolio
    $folio_container.shuffle( 'shuffle', selected );
    # Updates the tag list for bigger screens
    $el = $tagsList.find ".tag-item a[rel=#{selected}]"
    $(".tag-item", $tagsList).removeClass "active"
    $el.closest('.tag-item').addClass "active"
    false