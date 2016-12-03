package Music::Schema::Result::Album;
use base qw/DBIx::Class::Core/;
 
 __PACKAGE__->load_components(qw/InflateColumn::DateTime/);
 __PACKAGE__->table('albums');
 __PACKAGE__->add_columns(
    albumid => {data_type => 'integer', is_nullable => 0, is_auto_increment => 1},
    artistid => {data_type => 'integer', is_nullable => 0},
    title    => { data_type => 'text', is_nullable => 0 },
    year    => { data_type => 'int', is_nullable => 1 },
 );
 __PACKAGE__->set_primary_key('albumid');
 __PACKAGE__->belongs_to(artist => 'Music::Schema::Result::Artist', 'artistid');
  
  1;

