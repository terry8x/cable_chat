$(document).on('turbolinks:load', function() {
  var messages = $('#messages');

  if ($('#messages').length > 0) {

    App.global_chat = App.cable.subscriptions.create({
      channel: "ChatRoomsChannel",
      chat_room_id: messages.data('chat_room_id')
    }, {
      connected: function() {},

      disconnected: function() {},

      received: function(data) {
        messages.append(data['message']);
      },

      send_message: function(message, chat_room_id) {
        return this.perform('send_message', {
          message: message,
          chat_room_id: chat_room_id
        });
      }
    });

    $('#new_message').submit(function(e) {
      var text_area = $(this).find('#message_body');

      if ($.trim(text_area.val()).length > 1) {
        App.global_chat.send_message(text_area.val(), messages.data('chat_room_id'));
        text_area.val('');
      }

      e.preventDefault();
      return false;
    });

  }
})

