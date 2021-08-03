class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :range
      t.integer :search
      t.text :word

      t.timestamps
    end
  end
end
