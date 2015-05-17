function [data] = testa( input_args )

ipadr2listen2 = '192.168.0.106';
ip_port = 80;

tout = 1;

t = tcpip (ipadr2listen2, ip_port, 'NetworkRole', 'Client', 'Timeout', 10 );

try
    sucess = true;
    fopen(t);
catch
  sucess = false 
end

if (sucess == true )
    data = fscanf (t);
end
   
end

