# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $('.best_in_place').best_in_place()
    $('#portfolio .portfolio-list').sortable({
       update: (event, ui) ->
       	object = {projects: ""}
       	object_string = '{'
       	$('#portfolio .portfolio_item').each (index, el) ->
    	   	object_string += '"item' + index + '": ' + ($(this).attr('data-object')) + ', '
       	object_string = object_string.slice(0, -2)
       	object_string += '}'
       	object["projects"] = $.parseJSON(object_string)
       	
       	$.post('/projects/sort/', object)
    })
    $('#testimonials .testimonials_cont').sortable({update: (event, ui) ->
        object = {projects: ""}
        object_string = '{'
        $('.testimonial', $(this)).each (index, el) ->
          object_string += '"item' + index + '": ' + ($(this).attr('data-object')) + ', '
        object_string = object_string.slice(0, -2)
        object_string += '}'
        object["testimonials"] = $.parseJSON(object_string)
        $.post('/testimonials/sort/', object)
    })