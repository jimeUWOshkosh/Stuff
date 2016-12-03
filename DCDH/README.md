JT Smith's DBIx::Class::DeploymentHandler scripts
MadMongers November 2016 Meeting

Scripts need to be executed in the bin directory
ex: $ perl 01_prepare_init.pl

$ cd etc
Move your flavor of RDBMS configuration file to config.json .
Edit config file to be your DB and user.
Edit each of the JT scripts to use the correct Schema.


01_prepare_init.pl
  prepare SQL from Schema
02_init.pl
  Execute SQL from 01_prepare_init.pl
03_prepare_upgrade.pl
  You just modified the Schema
  AND, AND you changed the VERSION number in ../lib/{PROJECT}/Schema.pm
  Creates SQL to make changes
04_upgrade.pl
  Execute SQL from 03_prepare_upgrade.pl
05_downgrade.pl
  Backout most recent RDBMS changes