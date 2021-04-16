#!/usr/bin/perl
#/******************************************************************************
#
#   Perl Script to configure and enable SNMP on SuSE Linux R10
#   Created by Jim Bodden -- 7/23/2012
#   Modified for TXDOT on 5/9/2013
#
#/******************************************************************************

#/******************************************************************************
# Modules used
#/******************************************************************************

use File::Copy;	


#/******************************************************************************
# Backup old snmpd.conf and create a new snmpd.conf
#/******************************************************************************

move("/etc/snmp/snmpd.conf","/etc/snmp/snmpd.jim");

open(MYOUTFILE, ">>/etc/snmp/snmpd.conf"); #open for write, append

# *** Print freeform text, semicol required ***
print MYOUTFILE "\nrouser  S3v0n301$\n";



#*** Close the file ***
close(MYOUTFILE);



exit;

