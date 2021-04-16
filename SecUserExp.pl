#!C:\strawberry\perl\bin -w  
# For MS Windows
#/******************************************************************************
#
#   Perl Script to parse security statistics and break them out to rows reformating the Excel sheet
#	Written for Bill Ferguson
#
#   Script: SecUserExp.pl -- Version 1.00
#   Scriptrue Compiled by: Bill Ferguson
#   Application Created by Jim Bodden -- 7/19/2013
#   Modified on -- 7/19/2013
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
