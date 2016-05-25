require "socket"

def hi(msg)
  u = UDPSocket.new
  u.connect("127.0.0.1", 31337)
  u.send msg, 0
  return u.recv(1024)
end

