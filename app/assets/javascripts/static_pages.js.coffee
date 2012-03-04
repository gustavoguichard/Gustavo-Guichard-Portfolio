# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#main hr, #footer hr').wrap("<div class='hr'/>")
	$("a[rel=tooltip]").tooltip({placement: 'bottom'})
	$("a.close").on "click", ->
		$(this).closest(".alert").fadeOut()

	folio_container = $('#portfolio .row')
	clone = folio_container.clone()
	$('.nav-pills a').on "click", ->
		el = $(this)
		$('li', el.parents('ul')).removeClass("active")
		el.parent().addClass("active");
		selected = el.attr('rel')
		if selected == 'all'
			filteredItems = clone.find('article')
		else
			filteredItems = clone.find('article[data-type~='+selected+']')
		folio_container.quicksand(filteredItems, 
        	{duration: 750, adjustHeight: 'dynamic'})
		false