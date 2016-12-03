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
};

my $dh = DBIx::Class::DeploymentHandler->new($dh_opts);
say "Installing a new database with version ".$dh->to_version;
$schema->storage->dbh->do('drop table if exists dbix_class_deploymenthandler_versions');
$dh->install();
say "done";
