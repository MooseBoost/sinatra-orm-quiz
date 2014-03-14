class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :age
      t.string :name
      t.text :stuff
      t.datetime :birth_date
    end
  end
end