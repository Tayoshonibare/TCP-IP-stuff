function [ sucess_string ] = sendovertcpip( data, ipadr, ip_port, u1)

address = java.net.InetAddress.getLocalHost; 
IPaddress = char(address.getHostAddress);

t =  u1;

    fprintf (t, data);
sucess_string = [data '-->' IPaddress ];

end

