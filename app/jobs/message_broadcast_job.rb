class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room_id}_channel", message: render_message(message)
  end

  private
    def render_message(msg)
      MessagesController.render partial: 'messages/list', locals: { msg: msg }
    end
end