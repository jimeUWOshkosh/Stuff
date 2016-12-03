package Music::Schema::Result::Artist;
use base qw/DBIx::Class::Core/;
 
 __PACKAGE__->table('artists');
 __PACKAGE__->add_columns(
    artistid => {data_type => 'integer', is_nullable => 0, is_auto_increment => 1},
    name    => { data_type => 'text', is_nullable => 0 },
    favorite_color    => { data_type => 'text', is_nullable => 1 },
  );
 __PACKAGE__->set_primary_key('artistid');
 __PACKAGE__->has_many(albums => 'Music::Schema::Result::Album', 'artistid');
  
  1;
