
$(document).ready(function() {

    var brands_suggested = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/brands_suggestion',
      remote: {
        url: window.location.origin + '/brands_suggestion?query=%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#item_brand').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
    },
    {
      displayKey: 'name',
      source: brands_suggested,
      templates: {
        suggestion: function (brand) {
            return '<p>' + brand.name + '</p>';
        }
      }
    });


    $('#item_brand').typeahead('val', $('#item_brand_name').val() );

    $('#item_brand').on('typeahead:select', function(object, datum){
        $('#item_brand_id').val(datum.id);
    });

    $('#item_brand').on('typeahead:change', function(event, data){
        $('#item_brand_id').val(data);
        $(this).trigger('typeahead:_propia', data)
    });

    $('#item_brand').on('blur', function() {
        data = $('#item_brand').val();
        $(this).trigger('typeahead:_propia', data)
        url = '/validate_suggested_brand';
        $.ajax({
            url: url,
            data: { brand_name: data },
            success: function(res){
                if (res["0"].valid == false){
                    // Marca no válida
                    $('#item_brand').css('border-color', 'red');
                }else{
                    // Marca correcta
                    $('#item_brand_id').val(res["0"].id.toString());
                    $('#item_brand').css('border-color', '#ccc');
                }
            }
        });
    });

    $('#item_brand').on('typeahead:_propia', function(evt, datum){
    });
});


	