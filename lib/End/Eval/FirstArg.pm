package End::Eval::FirstArg;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

my $code;
sub import {
    my $class = shift;
    $code = shift @ARGV;
}

END {
    $code = '' unless defined $code;
    print "DEBUG: eval-ing $code ...\n" if $ENV{DEBUG};
    eval "no strict; no warnings; $code;";
    die if $@;
}

1;
# ABSTRACT: Take code from first command-line argument, then eval it in END block

=head1 SYNOPSIS

On the command-line:

 % perl -MEnd::Eval::FirstArg `which some-perl-script.pl` 'use Data::Dump; dd \%INC' ...
 % PERL5OPT=-MEnd::Eval::FirstArg some-perl-script.pl 'use Data::Dump; dd \%INC' ...


=head1 DESCRIPTION

This module allows you to specify a code in the first command-line argument,
basically for convenience in one-liners.


=head1 FAQ


=head1 SEE ALSO

Other C<End::Eval::*> (like L<End::Eval> and L<End::Eval>) and C<End::*>
modules.

Other C<Devel::End::*> modules (but this namespace is deprecated in favor of
C<End>).

=cut
