//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.trap = App.cable.subscriptions.create('RequestsChannel', {
    received: function (data) {
        console.log(data);
        addReq(data);
    }
});

function addReq(data) {
    var new_req = $('#req_'+data.req_id);

    if(new_req.length) {
        /* code if request already exists */
        $('#alert_s').show();
        setTimeout(function(){
            $('#alert_s').hide();
        }, 3000);
    } else {
        /* code if this request not found */
        $('#req_list tbody').append(
            '<tr><td>' + '<a href="' + data.path_url + '/requests" id="req_'+data.req_id +'">' +data.path_url +'</a>'+  '</td><td><a href="' + data.path_url + '/requests">Show request statistic</a> ||'+'<a href="requests/' + data.req_id + '" data-method="delete"> Destroy</a></td></tr>'
        );
    }
}
