    #!C:\strawberry\perl\bin -w  
    use Tk;
    use strict;

    my $mw = MainWindow->new;
    $mw->Label(-text => 'Hello, Sara!')->pack;
    $mw->Button(
        -text    => 'Quit',
        -command => sub { exit },
    )->pack;
    MainLoop;
    
