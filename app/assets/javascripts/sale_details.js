$(document).ready(function(){

    $("#new-detail-modal").on("shown.bs.modal", function() {

    	var items_suggested = new Bloodhound({
    	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("description"),
    	  queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: window.location.origin + '/items_suggestion',
    	  remote: {
            url: window.location.origin + '/items_suggestion?query=%QUERY',
        	wildcard: '%QUERY'
    	  }
    	});

    	$('#sale_details_item').typeahead({
    		  hint: true,
    		  highlight: true,
    		  minLength: 1
    	},
    	{
    	  displayKey: 'description',
    	  source: items_suggested,
          templates: {
            suggestion: function (item) {
                return '<p>' + item.description + '</p>';
            }
          }
    	});


    	$('#sale_details_item').typeahead('val', $('#sale_details_item_description').val() );

    	$('#sale_details_item').on('typeahead:select', function(object, datum){
            $('#sale_details_item').val(datum.id);
        });

        $('#sale_details_item').on('typeahead:change', function(event, data){
            $('#sale_details_item').val(data);
        	$(this).trigger('typeahead:_propia', data)
        });

        $('#sale_details_item').on('blur', function() {
        	data = $('#sale_details_item').val();
        	$(this).trigger('typeahead:_propia', data)
        	url = '/validate_suggested_item';
        	$.ajax({
        		url: url,
        		data: { item_description: data },
        		success: function(res){
        			if (res["0"].valid == false){
        				// Item no válido
        				$('#sale_details_item').css('border-color', 'red');
        			}else{
        				// Item correcto
                        $('#sale_details_item_id').val(res["0"].id.toString());
        				$('#sale_details_item').css('border-color', '#ccc');
        			}
        		}
        	});
        });

        $('#sale_details_item_item').on('typeahead:_propia', function(evt, datum){
        });
    });
});