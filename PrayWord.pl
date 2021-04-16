#!C:\strawberry\perl\bin -w  
# For MS Windows
#/******************************************************************************
#
#   Perl Script to Pray The Word
#
#   Script: PrayWord.pl -- Version 1.00
#   Scriptrue Compiled by: Ron Brigmon
#   Application Created by Jim Bodden -- 6/30/2013
#   Modified on -- 6/30/2013
#
#/******************************************************************************

#/******************************************************************************
# Modules used
#/******************************************************************************

use Tk;
use warnings;
use strict;
use vars;

#/******************************************************************************
# Variables Defined
#/******************************************************************************

sub prayersub; # defines upcoming subroutine(s)
sub prepprom; 

my $CAT = "Catagory";
our $PRAYER = "Final Prayer Output";
our $PREP = "Preparatory Promise";

#/******************************************************************************
#
# START SCRIPT EXECUTABLE CODE
# What catagory does your prayer request fall into?
#
#/******************************************************************************


print "Enter the prayer Catagory\n";
$CAT =  <STDIN>;
chomp ($CAT);
print "User typed $CAT\n";
prayersub ();
prepprom ();


#/******************************************************************************
# Report status and exit the script
#/******************************************************************************

print "Back to MAIN\n";
print "\$PRAYER \= $PRAYER\n";

exit;


	#/******************************************************************************
	#
	#           End of application script; function() definitions follow...
	#
	#/******************************************************************************


sub prayersub(){

	#/******************************************************************************
	# Put it all together into a prayer
	#/******************************************************************************

	print "Now in subroutine 'prayersub' $CAT\n";
	our $PRAYER = "$CAT";
	print "\$PRAYER \= $PRAYER\n";
}

sub prepprom(){

	#/******************************************************************************
	# Put it all together into a prayer
	#/******************************************************************************

	print "Select a preparatory promise:\n\n";
	print "1) Psalm 34:15 The eyes of the Lord are on the righteous, and His ears are open to their cry.\n";
	print "2) Psalm 37:4 Delight yourself also in the Lord, and He shall give you the desires of your heart.\n";
	print "3) psalm 91:15-16 He shall call upon Me, and I will answer him; I will be with him in trouble; I will deliver him and honor him. With long life I will satisfy him, and show him My salvation.\n";
	print "4) Isaiah 55:11 So shall My word be that goes forth from My mouth; it shall not return to Me void, but it shall accomplish what I please, and it shall prosper in the thing for which I sent it.\n";
	print "5) Jeremiah 1:12 Then the Lord said to me, you have seen well, for I am ready to perform My word.\n";
	print "6) Jeremiah 33:3 Call to Me, and I will answer you, and show you great and mighty things, which you do not know.\n";
	print "7) Matthew 18:19 Again I say to you that if two of you agree on earth concerning anything that they ask, it will be done for them by My Father in heaven.\n";
	print "8) John 15:7 If you abide in Me, and My words abide in you, you will[a] ask what you desire, and it shall be done for you..\n";
	print "9) John 16:23-24 And in that day you will ask Me nothing. Most assuredly, I say to you, whatever you ask the Father in My name He will give you. Until now you have asked nothing in My name. Ask, and you will receive, that your joy may be full.\n";
	print "10) 1 john 5:14-15 Now this is the confidence that we have in Him, that if we ask anything according to His will, He hears us. And if we know that He hears us, whatever we ask, we know that we have the petitions that we have asked of Him.\n";

	print "Enter the Preparatory Promise\n";
	$PREP =  <STDIN>;
chomp ($PREP);
print "User typed $PREP\n";

}

	#/******************************************************************************
	#
	#       END OF CODE  ---  END OF CODE  ---  END OF CODE  ---  END OF CODE 
	#
	#/******************************************************************************
