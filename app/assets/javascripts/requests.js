
$(function () {

    $('#new_get').on('ajax:success', function(event, data, status, xhr) {
    //     insert the failure message inside the "#account_settings" element
    //     var detail = event.detail;
    //     var data = detail[0], status = detail[1], xhr = detail[2];
    //     console.log(data);
    //     addMessage(data);
        $('#url_path').val('');
    });

    // Pusher.logToConsole = true;

    var pusher = new Pusher('375f7c75b2f9382b0fd1', {
        cluster: 'eu',
        encrypted: true
    });

    var channel = pusher.subscribe('request-channel');
    channel.bind('request-event', function(data) {
        console.log(data);
        addReq(data);
    });
});

function addReq(data) {
    var new_req = $('#req_'+data.req_id);

    console.log(new_req);
    if(new_req.length) {
        /* code if request already exists */
        alert('request info was saved')
    } else {
        /* code if not found */
        $('#req_list tbody').append(
            '<tr><td>' + '<a href="' + data.path_url + '/requests" id="req_'+data.req_id +'">' +data.path_url +'</a>'+  '</td><td><a href="' + data.path_url + '/requests">Show request info</a> ||'+'<a href="requests/' + data.req_id + '" data-method="delete"> Destroy-</a></td></tr>'
        );
    }
}
