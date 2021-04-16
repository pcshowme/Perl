#!/usr/bin/perl
#/******************************************************************************
#
#   Perl Script to configure remote SIEM logging on SuSE Linux
#
#   Script: siem-on.pl -- Version 2.43
#   Created by Jim Bodden -- 2/14/2013
#   Modified on -- 3/17/2013
#
#/******************************************************************************

#/******************************************************************************
# Modules used
#/******************************************************************************

use File::Copy;	
use Sys::Hostname;

#/******************************************************************************
#
# START SCRIPT EXECUTABLE CODE
# Is the server configured for remote logging already?
#
#/******************************************************************************

system (clear);
$HNAME = hostname;
$HNAME1UC = uc($HNAME);
$DATA_FILE="/etc/syslog-ng/syslog-ng.conf";

open(FILE,$DATA_FILE);
if (grep{/loghost/} <FILE>){
	print "It appears that this host is or had been configured for remote logging already.\n";
	print "Please inspect and manually configure this server for remote SIEM logging.\n";
	$STAT="siem-on.pl executed but it appears that this host is or had been configured for remote logging already.  Please inspect and manually configure this server for remote SIEM logging.";
	$STAT_FILE = $HNAME . ".no.SIEM";
}
else{
	print "Remote logging not previously configured, configuring now...\n\n";
	VMlocation();
	ConfigureSIEM();
	$STAT="siem-on.pl executed -- SYSLOG.CONF configured for remote SIEM logging.";
	$STAT_FILE = $HNAME . ".yes.SIEM";
	system (tail,"-11","/etc/syslog-ng/syslog-ng.conf");
	system "sudo /etc/init.d/syslog status";
}
close FILE;


#/******************************************************************************
# Report status and exit the script
#/******************************************************************************

system (logger,"$STAT");
system (touch,"/tmp/$STAT_FILE");

exit;

	#/******************************************************************************\#
	#/*********                                                            *********\#
	#           End of application script; function() definitions follow...          #
	#/*********                                                            *********\#
	#/******************************************************************************\#


sub ConfigureSIEM(){

	#/******************************************************************************
	# Backup old syslog-ng.conf and append syslog-ng.conf with SIEM informaion
	#/******************************************************************************

	copy("/etc/syslog-ng/syslog-ng.conf","/etc/syslog-ng/syslog-ng.jim");

	$R1 = "## set up logging to loghost \n";
	$R2 = "destination loghost \{ \n";
	$R3 = "udp\(\"$SIEMCFG\" port\(514\)\)\; \n";
	$R4 = "\}; \n";
	$SP1 = " \n";
	$L1 = "# send everything to loghost, to \n";
	$L2 = "log \{ \n";
	$L3 = "source(src); \n";
	$L4 = "destination(loghost); \n";
	$L5 = "\}; \n";

	open (FOUT, '>>/etc/syslog-ng/syslog-ng.conf')or die "Couldn't open file $!";
	print FOUT "$SP1$R1$R2$R3$R4$SP1$L1$L2$L3$L4$L5";
	close FOUT or die "Cannot close $FOUT: $!";

	#/******************************************************************************
	# Initialize the changes and restart the syslog process
	#/******************************************************************************

	# system "sudo SuSEconfig";  ## This line only necissary if the /etc/syslog-ng/syslog-ng.conf.in file were being edited.
	system "sudo /etc/init.d/syslog restart";
}

sub VMlocation(){
	#/******************************************************************************
	# Determin if the Host is in the ADC, SDC or on site for SIEM IP configuration
	#/******************************************************************************
	
	$SIEMCFG = "204.67.120.160";     # Assumes Host is in the ADC or on-site
	$LOCATION = "ADC";
	@LOCADC = ( "4AV", "4AP", "AAV", "AUV" );
	@LOCSDC = ( "4SV", "4SP", "SAV", "SUV" );

	foreach $LOC (@LOCSDC) {
		if ($HNAME1UC =~ /$LOC/) {
			$LOCATION = "SDC";
			$SIEMCFG = "204.67.202.160";     # Sets $SIEMCFG if the Host is in the SDC
		}
	}
	if ($LOCATION eq "ADC"){
		print "$HNAME1UC is in the ADC or on-site at the agency\n";
	}
	else {
		print "$HNAME1UC is in the SDC\n";
	}
}

	#/******************************************************************************
	#
	#       END OF CODE  ---  END OF CODE  ---  END OF CODE  ---  END OF CODE 
	#
	#/******************************************************************************
