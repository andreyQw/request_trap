$(function () {
    console.log('form method');
    console.log('action');
    var hidden_input_method = '<input id="hidden_meth" type="hidden" name="_method" value="">';
    console.log(hidden_input_method);

    $("#url").on("change paste keyup", function() {
        $('#form_change').attr('action', $(this).val());
        $('#show_url').text($(this).val());
        // alert($(this).val());
    });

    $('#method_option').change(function() {

        var $option = $(this).find('option:selected');

        var value = $option.val();

        $('#form_change').attr('method', value);

        $('input[name=_method]').val(value);

        $('input[name=authenticity_token]').val($('meta[name="csrf-token"]').attr('content'));
    });


});