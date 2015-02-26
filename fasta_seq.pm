package fasta_seq;
use strict;
use warnings;

sub new
{
    my $class=shift;
    my %param=@_;
    die "You'll have to provide ID and sequence for a fasta_seq object" unless (exists $param{ID} and exists $param{seq});
    my $self={ID=>$param{ID},species=>$param{species},
	      seq=>$param{seq},desc=>$param{desc}};
    bless $self,$class;
    return $self;
}

sub ID
{
    my $self=shift;
    if (defined $_[0])
    {
	die "Non valid ID" if ($_[0]=~/\s/);
	$self->{ID}=shift;
    }
    return $self->{ID};
}

sub species
{
    my $self=shift;
    $self->{species}=shift if defined $_[0];
    return $self->{species};
}

sub as_fasta
{
    my $self=shift;
    my$fasta=">".$self->ID;
    if (defined $self->species){$fasta.=" ".$self->species;}
    $fasta.=" ".$self->desc if (defined $self->desc);
    $fasta.="\n".$self->seq."\n";
    return $fasta;
}

sub seq
{
    my $self=shift;
    $self->{seq}=shift if defined $_[0];
    return $self->{seq};
}

sub desc
{
    my $self=shift; 
    $self->{desc}=shift if defined $_[0];
    return $self->{desc}; 
}
1;
