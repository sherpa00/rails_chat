class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user).order(created_at: :desc)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = User.find(message_params[:user_id])

    if @message.save
      # Here, prepend the new message to the "messages" target in Turbo Stream
      broadcast = turbo_stream.append 'messages', partial: 'messages/message', locals: { message: @message }
  
      # Broadcast to all subscribers of the "messages" stream
      ActionCable.server.broadcast('messages', broadcast)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
