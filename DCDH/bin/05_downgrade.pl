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
    databases           => [ qq/ $dbvendor / ],
    script_directory    => "../upgrades",
    to_version          => $schema->schema_version - 1,
};

my $dh = DBIx::Class::DeploymentHandler->new($dh_opts);
my $code_version = $schema->schema_version;
say "Downgrading";
my $db_version = $dh->database_version;
if ($db_version > $dh->to_version) {
    $dh->downgrade;
    say "done";
}
else {
    say "No downgrades required.  Code version = $code_version, database version = ".$dh->to_version;
}

