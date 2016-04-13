class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :string
      t.integer :integer
      t.text :text
      t.time :time
    end
  end
end