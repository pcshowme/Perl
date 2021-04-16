use IO::Socket;
my $sock = new IO::Socket::INET (
	PeerAddr => '192.168.1.25',
	PeerPort => '7070',
	Proto => 'tcp',
	);
die "Could not create socket: $!\n" unless $sock;
print $sock "Hello there!\n";
print $sock `whoami\n`;
close($sock);
