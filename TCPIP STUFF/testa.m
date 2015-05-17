function [ sucess_string ] = testa( input_args )

ipadr = '192.168.0.105';
ip_port = 80;
data = 'jhgbhgbjhgbjhgvbh';

t = tcpip (ipadr, ip_port, 'NetworkRole', 'Server' );

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

