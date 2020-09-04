# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create('username' => 'Nate')
user2 = User.create('username' => 'Paulo')

artwork1 = Artwork.create('title' => 'masterpiece', 'image_url' => 'https://www.google.com/search?q=abstract&rlz=1C5CHFA_enUS869US869&sxsrf=ALeKk02v-c5LZ0eZGP9WZv8T6fRGk7nRDg:1599172005468&source=lnms&tbm=isch&sa=X&ved=2ahUKEwji8sf6g87rAhX5FjQIHaRRD7QQ_AUoAXoECBEQAw&biw=720&bih=952#imgrc=MCY6aumXZa2HdM', 'artist_id' => user1.id)
artwork2 = Artwork.create('title' => 'abstract1', 'image_url' => 'https://www.google.com/search?q=abstract&rlz=1C5CHFA_enUS869US869&sxsrf=ALeKk02v-c5LZ0eZGP9WZv8T6fRGk7nRDg:1599172005468&source=lnms&tbm=isch&sa=X&ved=2ahUKEwji8sf6g87rAhX5FjQIHaRRD7QQ_AUoAXoECBEQAw&biw=720&bih=952#imgrc=1tHiD1Q0W1Y6vM', 'artist_id' => user2.id)

artwork_share1 = ArtworkShare.create('artwork_id' => artwork1.id, 'viewer_id' => user2.id)
artwork_share2 = ArtworkShare.create('artwork_id' => artwork2.id, 'viewer_id' => user1.id)