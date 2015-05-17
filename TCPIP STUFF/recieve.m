function recieve()

t = tcpip (ipadr2listen2, ip_port, 'NetworkRole', 'Client', 'Timeout', 1 );

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

