class AddDateToProgresses < ActiveRecord::Migration[5.1]
  def change
    add_column :progresses, :date, :date
  end
end
