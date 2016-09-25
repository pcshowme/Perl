use win32;
use Tk;


my @menu_items = (
    '&File' => 'File',
    ' > &Open'   => {
        -name    => 'FileOpen', 
        -onClick => sub { $self->onFileOpen(@_) },
    },
    ' > &Close'  => { 
        -name    => 'FileClose',
        -onClick => sub { $self->onFileClose(@_) },
    },
    ' > E&xit'   => { 
        -name    => 'FileExit',
        -onClick => sub { $self->onFileExit(@_) },
    },
    '&Help' => 'Help',
    ' > &About'  => { 
        -name    => 'About',
        -onClick => sub { $self->onHelpAbout(@_) },
    },
);

$self->set_main_menu( Win32::GUI::MakeMenu(@menu_items) );

my $window = $self->set_main_window(
    Win32::GUI::Window->new(
        -menu => $self->get_main_menu,
        -name => 'Main',
        -sizable => 0,
        -resizable => 0,
        -hasmaximize => 0,
        -maximizebox => 0,
        -title => $self->get_program_name,
        -onTerminate => sub { -1 }, 
        -onTimer => sub { $self->onTimer(@_) },
    ),
);

$self->set_log_field(
    $window->AddTextfield(
        -name => 'Log',
        -font => Win32::GUI::Font->new(
            -name => 'LogFont',
            -face => 'Courier New',
            -size => 9,
        ),
        -multiline => 1,
        -wantreturn => 1,
        -autovscroll => 1,
        -vscroll => 1,
        -readonly => 1,
    ),
);

$self->get_log_field->MaxLength(40000);

$self->set_status_bar(
    $window->AddStatusBar(
        -name => 'Status',
        -text => $self->get_program_name,
    ),
);
