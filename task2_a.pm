#!/usr/bin/perl

package Animal;

sub new {
	my ($class) = @_;
	my $self = {
		'_name' => 'это название',
		'_desc' => 'это описание',
	};
	bless $self, $class;
	return $self;
}

sub getName {
	my ($self) = @_;
	print $self->{'_name'};
	return;
}

sub getDesc {
	my ($self) = @_;
	print $self->{'_desc'};
	return;
}

1;
