function [ output_args ] = openrecieve( input_args )

t = tcpip('192.168.0.109', 80);44
%set(t, 'InputBufferSize', 3000000);

fopen(t);
fprintf (t, 'WhHHhhhOOOoo!!!hoooo');


end

