class CreateArtWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :art_works do |t|
    end
    drop_table :art_works
  end
end
