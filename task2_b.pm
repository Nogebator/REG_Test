#!/usr/bin/perl

package Cat;

use Animal;
our @ISA = qw(Animal);

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new();
	bless $self, $class;
	return $self;
}

sub getName {
	my ($self) = @_;
	print 'Кошка ';
	$self->SUPER::getName();
	return;
}

1;
