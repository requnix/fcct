class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title

      t.date :occurs_on
      t.datetime :starts_at
      t.datetime :ends_at

      t.attachment :poster
      t.text :writeup
      t.integer :writeup_author_id

      t.boolean :committee_only
      t.boolean :marshal_only

      t.timestamps
    end
  end
end
