# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Image-Random.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More 'no_plan';
BEGIN { use_ok('Image::Random') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use List::Util qw/first/;

my @results = map { Image::Random->from_dir('.') } (1..4) ;
warn "@results";
my $x       = first { $_ eq 'x.jpg' } @results;
ok($x, 'x.jpg found');

