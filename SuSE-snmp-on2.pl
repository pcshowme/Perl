#!/usr/bin/perl
#/******************************************************************************
#
#   Perl Script to configure and enable SNMP on SuSE Linux R10
#   Created by Jim Bodden -- 7/23/2012
#
#/******************************************************************************

#/******************************************************************************
# Modules used
#/******************************************************************************

use File::Copy;	


#/******************************************************************************
# Is net-snmp installed on this server?
#/******************************************************************************

if (! -e "/etc/snmp") {
	open $FILER, '<', "/etc/SuSE-release"; 
	$VER = <$FILER>; 
	close $FILER;
	print "Mount the media -- $VER \n";
	WaitForKey();
	system "yast -i net-snmp";

}
else {
	print "SNMP is installed... \n";
}

#/******************************************************************************
# Backup old snmpd.conf and create a new snmpd.conf
#/******************************************************************************

move("/etc/snmp/snmpd.conf","/etc/snmp/snmpd.jim");

$RON1 = "rouser S3v0n301\$ \n";
$RON2A = "rocommunity public 127.0.0.1 \n";
$RON2B = "rocommunity S3v0n301\$ \n";

$TS1 = "trapsink  204.67.120.95 \n";
$TS2 = "trapsink  204.67.202.95 \n";

$T2S1 = "trap2sink  204.67.120.95 \n";
$T2S2 = "trap2sink  204.67.202.95 \n";

$IS1 = "informsink  204.67.120.95 \n";
$IS2 = "informsink  204.67.202.95 \n";

$TC = "trapcommunity  S3v0n301\$ \n";

$AT = "authtrapenable  1 \n";

$SL1 = "syslocation Server Room \n";
$SL2 = "syslocation  \"Austin, TX\" \n";

$SC1 = "syscontact Sysadmin (root@localhost) \n";
$SC2 = "syscontact  Xerox  \n";

open FOUT, ">/etc/snmp/snmpd.conf" or die $!;
print FOUT "$RON1 $RON2A $RON2B $TS1 $TS2 $T2S1 $T2S2 $IS1 $IS2 $tc $AT $SL1 $SL2 $SC1 $SC2";
close FOUT or die "Cannot close $FOUT: $!";

#/******************************************************************************
# Enable the SNMPD service
#/******************************************************************************

system "sudo insserv snmpd";


#/******************************************************************************
# restart the SNMPD service
#/******************************************************************************

system "/etc/init.d/snmpd restart";

exit;


sub WaitForKey(){
	print"Press <ENTER> to continue...\n";
	chomp($KEY=<STDIN>);
}
