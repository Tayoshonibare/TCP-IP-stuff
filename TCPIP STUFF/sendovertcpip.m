function [ cmd_string, IPaddress ] = sendovertcpip( data, u1)

address = java.net.InetAddress.getLocalHost;
IPaddress = char(address.getHostAddress);

t =  u1;

to_send_string = [ data,'**-From->',IPaddress];
to_send_data = to_send_string;

fprintf (t, to_send_data);

cmd_string = [data '   **-From->' 'This station' ];  %just to senders terminal

end

