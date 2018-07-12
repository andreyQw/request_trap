
function change_method(sel) {
    // var method = $('#method_option').find('option:selected');

    $('#form_change').attr('method', sel.value);
    $('input[name=_method]').val(sel.value);
}

function change_action(input_url) {
    $('#form_change').attr('action', input_url.value);
    $('#show_url').text(input_url.value);
}