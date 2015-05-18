
 u1 = udp('192.168.0.106', 'RemotePort', 808, 'LocalPort', 808);
 fopen (u1);
u1


fclose(u1);
delete(u1)
clear u1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run = timer('TimerFcn', {@UDP_checker, handles}, 'ExecutionMode','fixedRate', 'Period', 1);
    start (run); 
else
    stop (run);
    delete (timerfind);
end