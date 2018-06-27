
$(function () {
    // $('#new_message').on('ajax:success', function(event) {
    $('#new_message').on('ajax:success', function(event, data, status, xhr) {
        // insert the failure message inside the "#account_settings" element

        // var detail = event.detail;
        // var data = detail[0], status = detail[1], xhr = detail[2];
        // console.log(data);


        // addMessage(data);
        $('#text').val('');
    });

    Pusher.logToConsole = true;

    var pusher = new Pusher('375f7c75b2f9382b0fd1', {
        cluster: 'eu',
        encrypted: true
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('new-event', function(data) {
        addMessage(data);
    });
});

function addMessage(data) {
    $('#messages_list tbody').append(
        '<tr><td>' + data.text +  '</td><td>' + data.user_name +
        '</td><td>Show</td><td>Edit</td><td>Destroy-</td></tr>'
    );
}