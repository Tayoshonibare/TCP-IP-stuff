function [ sucess_string ] = sendovertcpip( data, ipadr, ip_port)

t = tcpip (ipadr, str2num (ip_port) , 'NetworkRole', 'Server' );

try
    sucess = true;
    fopen(t);
catch
  sucess = false;     
end

if (sucess == true )
    fprintf (t, data);
    sucess_string = 'Packent sucessfully sent';
else
   sucess_string = 'Failed to send packet; Check Network Connections';   
end



end

