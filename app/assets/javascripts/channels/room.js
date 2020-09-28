App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    //フロント側からサーバ側を監視できているかを確認できた時に関数
    console.log("success connected from front side")
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data.message.content)
    // Called when there's incoming data on the websocket for this channel
    //新しいP要素を用意する
    const node = document.createElement("p");
    //受信したメッセージを変数に入れる createtextNode(): HTML文字をエスケープできる
    const textnode = document.createTextNode(data.message.content);
    node.appendChild(textnode);

    //DOMに新しく作られた要素とその内容を追加する
    document.getElementById("new_message").appendChild(node)
    
    document.getElementById('message_content').value = ''
    
  },

  
});
