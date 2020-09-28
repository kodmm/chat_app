class RoomChannel < ApplicationCable::Channel
  def subscribed
   
    # stream_from "some_channel"   #サーバ側からフロントエンド側を監視できているかを確認できた際に動くメソッド
    3.times { puts "success connected from server side" }
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak(data)
  #   binding.pry
  #   one_message = Message.create!(content: data[:message], user_id: current_user.id)
  #   ActionCable.server.broadcast 'room_channel', one_message 
  #   #第一引数（どこのチャンネルにブロードキャストするか): room_channel, 
  #   #aseets/javascripts/channels/room.jsの1行目の(RoomChannel)を指定している。

  #   #第二引数　渡すデータ
  # end
end
