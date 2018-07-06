//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.trap = App.cable.subscriptions.create('ReqInfoChannel', {
    received: function (data) {
        var req_info_id = $('#req_info').attr('data-id');
        // console.log(data);
        if (req_info_id == 'all'){
            addReqInfo(data);
        }else {
            if (req_info_id == data.req_id){
                addReqInfo(data);
            }
        }
    }
});

function addReqInfo(data) {
    $('#req_info tbody').append(
        '<tr><td>'+ data.path_url +'</td><td>'+ data.remote_ip + '</td><td>'+ data.req_method +'</td><td>'+ data.scheme +'</td><td>'+ data.query_string +'</td><td>'+ data.query_params +'</td><td>'+ data.cookies + '</td><td>'+ data.headers +'</td></tr>'
    );
}
