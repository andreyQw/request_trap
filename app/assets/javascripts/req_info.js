
$(function () {
    // Pusher.logToConsole = true;

    var pusher = new Pusher('375f7c75b2f9382b0fd1', {
        cluster: 'eu',
        encrypted: true
    });

    var req_info_id = $('#req_info').attr('data-id');
    if (req_info_id == 'all'){

        var channel = pusher.subscribe('req_info-channel');
        channel.bind('req_info-event', function(data) {
            // alert(data.path_url);
            // console.log(data);
            addReqInfo(data);
        });
    }else {

        var channel = pusher.subscribe(req_info_id+'-channel');
        channel.bind(req_info_id+'-event', function(data) {
            // console.log(data);
            addReqInfo(data);
        });
    }
});

function addReqInfo(data) {
    $('#req_info tbody').append(
        '<tr><td>'+ data.path_url +'</td><td>'+ data.remote_ip + '</td><td>'+ data.req_method +'</td><td>'+ data.scheme +'</td><td>'+ data.query_string +'</td><td>'+ data.query_params +'</td><td>'+ data.cookies +'</td></tr>'
    );
}