class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.integer :age
      t.integer :univ
      t.integer :grade

      t.timestamps
    end
  end
end
