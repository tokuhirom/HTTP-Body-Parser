package HTTP::Body::Parser::UrlEncoded;
use strict;
use warnings;
use utf8;
use 5.010_001;
use parent qw(HTTP::Body::Parser::Base);
use URL::Encode ();

sub spin {
    my ($fh, $content_length) = shift;
    return unless $self->length == $self->content_length;

    my $dat = URI::Encode::url_param_mixed($self->buf);
    $self->{params} = Hash::MultiValue->from_mixed($dat);
}

1;

