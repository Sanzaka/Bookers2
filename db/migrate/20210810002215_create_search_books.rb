class CreateSearchBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :search_books do |t|
      t.string :date

      t.timestamps
    end
  end
end
