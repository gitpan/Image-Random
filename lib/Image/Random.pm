package Image::Random;

use 5.006001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Image::Random ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.02';

my $image_filter = qr/[.](gif|jpeg|jpg|png)$/;
srand (&srander);

# Preloaded methods go here.
sub srander { time ^ $$ }

sub od {
  my $some_dir = shift;

  opendir(DIR, $some_dir) or die "can't opendir $some_dir: $!";
  readdir(DIR);
}

sub from_dir {
  my ($class, $dir) = @_;

  my @content = grep { /$image_filter/ } od($dir) ;

  $content[rand @content];
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Image::Random - select random image from a file

=head1 SYNOPSIS

  use Image::Random;
  printf '<img src="%s">', Image::Random->from_dir('/img/frontpage') ;

=head1 DESCRIPTION

This module selects an image at random from a specified directory. It
filters the file list using the regexp

     /[.](gif|jpeg|jpg|png)$/

which is stored in the scalar C<$Image::Random::image_filter>

The random number seed is the function C<Image::Random::srander>.

At present, it does not recursively
search directories --- it simply looks in the present directory.


=head2 EXPORT

None by default.



=head1 SEE ALSO

=over 4

=item * perldoc srand

=item * perldoc perlretut

=cut

=head1 AUTHOR

Terrence Brannon, E<lt>terry@hcoop.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Terrence Brannon

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.4 or,
at your option, any later version of Perl 5 you may have available.


=cut
