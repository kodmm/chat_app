class RoomsController < ApplicationController
  def show
    @messages = Message.includes(:user).order(:id)
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(chat_parameters)
    respond_to do |format|
      if @message.save!
        #投稿されたメッセージをチャット参加者に配信
        ActionCable.server.broadcast 'room_channel', message: @message
        format.html { redirect_to @message}
      else
        format.html{ render :new }
      end
    end

    
    
  end

  private
   def chat_parameters
    params.require(:message).permit(:content)
   end
    
end
