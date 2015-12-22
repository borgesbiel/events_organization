class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :image
      t.string :address
      t.date :event_date

      t.timestamps null: false
    end
  end
end
