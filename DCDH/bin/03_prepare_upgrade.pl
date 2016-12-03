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
    sql_translator_args => { add_drop_table => 0 },
    script_directory    => "../upgrades",
    force_overwrite     => 1,
};

my $dh = DBIx::Class::DeploymentHandler->new($dh_opts);
my $code_version = $schema->schema_version;
say "Prepare upgrade information for $code_version";
if ( $code_version > 1 ) {
    say "\tgenerating install script";
    $dh->prepare_install();
    say "\tgenerating upgrade script";
    my $previous_version = $code_version - 1;
    $dh->prepare_upgrade( {
            from_version => $previous_version,
            to_version   => $code_version,
            version_set  => [ $previous_version, $code_version ],
        } );

    say "\tgenerating downgrade script";
    $dh->prepare_downgrade( {
            from_version => $code_version,
            to_version   => $previous_version,
            version_set  => [ $code_version, $previous_version ],
        } );

}
say "done";

