#!/usr/bin/perl
#/******************************************************************************
#
#   Perl Script to configure and enable SNMP on SuSE Linux R10
#   Created by Jim Bodden -- 7/23/2012
#   Modified for TXDOT on 5/9/2013
#   Ver 2.00
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
	print "The snmp service needs to be installed on this server \n";
}
else {
	print "SNMP is installed... \n";
}

#/******************************************************************************
# Backup old snmpd.conf and create a new snmpd.conf
#/******************************************************************************

copy("/etc/snmp/snmpd.conf","/etc/snmp/snmpd.jim");

open(MYOUTFILE, ">>/etc/snmp/snmpd.conf"); #open for write, append

# *** Print freeform text, semicol required ***
print MYOUTFILE <<"MyLabel";

##### SevOne configuration starts here #####

rouser  S3v0n301$
rocommunity public 127.0.0.1
rocommunity  S3v0n301$

trapsink  204.67.120.95
trapsink  204.67.202.95

trap2sink  204.67.120.95
trap2sink  204.67.202.95

informsink  204.67.120.95
informsink  204.67.202.95

trapcommunity  S3v0n301$

authtrapenable  1

syslocation Server Room
syslocation  "Austin, TX"

syscontact Sysadmin (root@localhost)
syscontact  Xerox


MyLabel

#*** Close the file ***
close(MYOUTFILE);


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
