$(document).ready(function() {

	var items_suggested = new Bloodhound({
	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("description"),
	  queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/items_suggestion',
	  remote: {
        url: window.location.origin + '/items_suggestion?query=%QUERY',
    	wildcard: '%QUERY'
	  }
	});

	$('#sale_sale_details_attributes_0_item').typeahead({
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


	$('#sale_sale_details_attributes_0_item').typeahead('val', $('#item_brand_name').val() );

	$('#sale_sale_details_attributes_0_item').on('typeahead:select', function(object, datum){
        $('#item_brand_id').val(datum.id);
    });

    $('#sale_sale_details_attributes_0_item').on('typeahead:change', function(event, data){
        $('#item_brand_id').val(data);
    	$(this).trigger('typeahead:_propia', data)
    });

    $('#sale_sale_details_attributes_0_item').on('blur', function() {
    	data = $('#sale_sale_details_attributes_0_item').val();
    	$(this).trigger('typeahead:_propia', data)
    	url = '/validate_suggested_brand';
    	$.ajax({
    		url: url,
    		data: { brand_name: data },
    		success: function(res){
    			if (["0"].valid == false){
    				// Marca no válida
    				$('#sale_sale_details_attributes_0_item').css('border-color', 'red');
    			}else{
    				// Marca correcta
                    $('#sale_sale_details_attributes_0_item_id').val(res["0"].id.toString());
    				$('#sale_sale_details_attributes_0_item').css('border-color', '#ccc');
    			}
    		}
    	});
    });

    $('#sale_sale_details_attributes_0_item').on('typeahead:_propia', function(evt, datum){
    });
});