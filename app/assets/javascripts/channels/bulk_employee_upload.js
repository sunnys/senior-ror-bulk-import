var pathArray = window.location.pathname.split('/');
var secondLevelLocation = pathArray[2];
App.bulk_employee_upload = App.cable.subscriptions.create({channel: "BulkEmployeeUploadChannel", upload_id: secondLevelLocation}, {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log("Connected")
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected")
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    if(data["message"]["total"] !== undefined) {
      $("#total").html(data["message"]["total"]);
      $("#created").html(data["message"]["created"]);
      $("#errored").html(data["message"]["errored"]);
    }
  },

  notify: function() {
    return this.perform('notify');
  }
});
