package HTTP::Body::Parser;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

sub new {
    my $class = shift;
    bless { handlers => [] }, $class;
}

sub register {
    my ($self, $content_type, $klass) = @_;
    push @{$self->{handlers}}, [$content_type, $klass];
}

sub new_instance {
    my ($self, $content_type, $content_length) = @_;

    for my $handler ($self->{handlers}) {
        my ($type, $klass) = @$handler;
        if (index($content_type, $type) == 0) {
            return $klass->new($content_type, $content_length);
        }
    }
}


1;
__END__

=encoding utf-8

=head1 NAME

HTTP::Body::Parser - It's new $module

=head1 SYNOPSIS

    use HTTP::Body::Parser;

=head1 DESCRIPTION

HTTP::Body::Parser is ...

=head1 LICENSE

Copyright (C) tokuhirom.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

tokuhirom E<lt>tokuhirom@gmail.comE<gt>

=cut

