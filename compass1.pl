#!/usr/bin/perl

$FILENAME="/etc/pam.d/common-password";
my @CP = do {
    open my $FH, "<", $FILENAME
        or die "could not open $FILENAME: $!";
    <$FH>;
};
print @CP;

$FILENAME="/etc/passwd";
my @PWD = do {
    open my $FH, "<", $FILENAME
        or die "could not open $FILENAME: $!";
    <$FH>;
};
print @PWD;

foreach ( @PWD ) {
	( $USERNAME, $PWD, $USERID, $GRPID, $GECOS, $HOMEDIR, $SHELL ) = split ( /:/ ); 
	print "Tell $USERNAME who cares about the rest...\n";
	system "chage -l $USER";
	}
#	

exit;

