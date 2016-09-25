    #!C:\strawberry\perl\bin -w  
    use strict;

    print "Please type a font name\n";
    my $font = <>; chomp $font;
    # Validate font

    print "Please type a file name\n";
    my $filename = <>; chomp $filename;
    # Validate filename

    print "Type <1> to fax, <2> to print\n";
    my $option = <>; chomp $option;
    if ($option eq 1) {
        print "Faxing $filename in font $font\n";
    } elsif ($option eq 2) {
        print "Now sending $filename to printer in font $font\n";
    }
