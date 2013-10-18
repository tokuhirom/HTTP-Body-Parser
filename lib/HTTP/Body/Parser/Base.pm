package HTTP::Body::Parser::Base;
use strict;
use warnings;
use utf8;
use 5.010_001;

use Class::Accessor::Lite 0.05 (
    ro => [qw(params uploads content_type content_length)],
);
use Carp ();

sub new {
    my $class = shift;
    my %args = @_==1 ? %{$_[0]} : @_;

    for my $key (qw(content_length content_type)) {
        unless (exists $args{$key}) {
            Carp::croak("Missing mandatory parameter: $key")
        }
    }

    bless {
        params  => Hash::MultiValue->new(),
        uploads => Hash::MultiValue->new(),
        %args,
    }, $class;
}

sub spin { Carp::confess "Abstract method." }

1;

