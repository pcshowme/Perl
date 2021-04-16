
#/******************************************************************************
#
#   Perl Script to configure and enable SNMP on TXDOT SuSE Linux
#
#   Script: SuSE-snmp-on.pl -- Version 1.21
#   Created by Jim Bodden -- 6/24/2013
#   Modified on -- 7/23/2012
#
#/******************************************************************************

#/******************************************************************************
# Modules used
#/******************************************************************************

use File::Copy;	


#/******************************************************************************
# Delete existing snmpd.conf, copy snmp.jim snmp.conf
#/******************************************************************************

system "/etc/snmp/snmpd.conf";
system "cp /etc/snmp/snmpd.jim /etc/snmp/snmpd.conf";

#/******************************************************************************
# Append to the new old snmpd.conf
#/******************************************************************************


$RON1 = "rouser S3v0n301\$ \n";
$RON2 = "rocommunity S3v0n301\$ \n";
$TC = "trapcommunity  S3v0n301\$ \n";

$TS1 = "trapsink  204.67.120.95 S3v0n301\$ \n";
$TS2 = "trapsink  204.67.202.95 S3v0n301\$ \n";

$T2S1 = "trap2sink  204.67.120.95 S3v0n301\$ \n";
$T2S2 = "trap2sink  204.67.202.95 S3v0n301\$ \n";

$IS1 = "informsink  204.67.120.95 S3v0n301\$ \n";
$IS2 = "informsink  204.67.202.95 S3v0n301\$ \n";

$AT = "authtrapenable  1 \n";

$SL1 = "syslocation Server Room \n";
$SL2 = "syslocation  \"Austin, TX\" \n";

$SC1 = "syscontact Sysadmin (root@localhost) \n";
$SC2 = "syscontact  Xerox  \n";


open FOUT, ">>/etc/snmp/snmpd.conf" or die $!;  #open for write, append
print FOUT "$RON1$RON2$TC$TS1$TS2$T2S1$T2S2$IS1$IS2$AT$SL1$SL2$SC1$SC2";
close FOUT or die "Cannot close $FOUT: $!";


#/******************************************************************************
# restart the SNMPD service
#/******************************************************************************

system "/etc/init.d/snmpd restart";

exit;

