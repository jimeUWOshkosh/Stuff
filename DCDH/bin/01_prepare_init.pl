use feature 'say';
use strict;
use lib '../lib';

use Music::Schema;
use DBIx::Class::DeploymentHandler;
use Config::JSON;

my $config = Config::JSON->new('../etc/config.json');


my $schema = Music::Schema->connect(@{$config->get('db')});
my $dbvendor = $config->get('dbvendor');

my $dh_opts = {
    schema              => $schema,
    databases           => [ qq/$dbvendor/ ],
    script_directory    => "../upgrades",
    force_overwrite     => 1,
};

my $dh = DBIx::Class::DeploymentHandler->new($dh_opts);
say "Preparing files to install a new database with version ".$dh->to_version;
$dh->prepare_install();
say "done";

