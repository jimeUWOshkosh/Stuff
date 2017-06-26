#!/usr/bin/env perl
use strict; use warnings;
use lib 'lib';
use PurchaseClones;

my $clone = PurchaseClones->new;
$clone->purchase_clone;
exit 0;
