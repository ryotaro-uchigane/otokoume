class CreateProgresses < ActiveRecord::Migration[5.1]
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.string :company_name
      t.integer :business_category
      t.integer :occupation_category
      t.integer :status

      t.timestamps
    end
  end
end
