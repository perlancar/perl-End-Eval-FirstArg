package End::Eval;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

my $code = '';
sub import {
    my $class = shift;
    $code = shift;
}

END {
    eval $code;
    die if $@;
}

1;
# ABSTRACT: Eval a code on END

=head1 SYNOPSIS

On the command-line:

 % PERL5OPT=-MEnd::Eval='use Data::Dump; dd \%INC' some-perl-script.pl


=head1 DESCRIPTION

This module allows you to specify a code to run in an END block.


=head1 SEE ALSO

Other C<End::*> modules.

Other C<Devel::End::*> modules (but this namespace is deprecated in favor of
C<End>).

=cut
