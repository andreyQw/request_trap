
$(function () {


    var req_info_id = $('#req_info').attr('data-id');
    if (req_info_id == 'all'){
    //    render all req_inf
    }else {
    //    render req_info by id
    }
});

function addReqInfo(data) {
    $('#req_info tbody').append(
        '<tr><td>'+ data.path_url +'</td><td>'+ data.remote_ip + '</td><td>'+ data.req_method +'</td><td>'+ data.scheme +'</td><td>'+ data.query_string +'</td><td>'+ data.query_params +'</td><td>'+ data.cookies + '</td><td>'+ data.headers +'</td></tr>'
    );
}