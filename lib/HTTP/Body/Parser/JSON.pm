package HTTP::Body::Parser::JSON;
use strict;
use warnings;
use utf8;
use 5.010_001;
use parent qw(HTTP::Body::Parser::Base);
use Hash::MultiValue;
use JSON::XS ();

sub spin {
    my ($self) = @_;
    return unless $self->length eq $self->content_length;

    my $dat = JSON::XS::decode_json($self->buffer);
    $self->params(Hash::MultiValue->from_mixed($dat));
}

1;

