require 'socket'
Socket.udp_server_loop("0.0.0.0", 31337) do |message, sender|
  puts message.to_s
  sender.reply <<~EOF
    Received the following message from you:
      #{message}
    EOF
end

