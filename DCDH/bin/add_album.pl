use feature 'say';
use strict;
use lib '../lib';

use Music::Schema;
use Config::JSON;
use Getopt::Long;

GetOptions (
    "name=s" => \my $name,
    "title=s" => \my $title,
    "year=i" => \my $year,
);

my $config = Config::JSON->new('../etc/config.json');


my $schema = Music::Schema->connect(@{$config->get('db')});

my $artists = $schema->resultset('Artist');
my $albums = $schema->resultset('Album');

my $artist = $artists->search({name => $name},{rows => 1})->single;

if (defined $artist) {
    my $album = $albums->new({});
    $album->artistid($artist->artistid);
    $album->title($title);
    $album->year($year);
    $album->insert;
    say sprintf('%s (%s) added', $album->title, $album->id);
}
else {
    say "artist not found";
}



