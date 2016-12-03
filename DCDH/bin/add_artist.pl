use feature 'say';
use strict;
use lib '../lib';

use Music::Schema;
use Config::JSON;
use Getopt::Long;

GetOptions (
    "name=s" => \my $name,
);

my $config = Config::JSON->new('../etc/config.json');


my $schema = Music::Schema->connect(@{$config->get('db')});

my $artists = $schema->resultset('Artist');

my $artist = $artists->new({});

$artist->name($name);


$artist->insert;

say sprintf('%s (%s) added', $artist->name, $artist->id);

