class AddBodyToProgresses < ActiveRecord::Migration[5.1]
  def change
    add_column :progresses, :body, :text
  end
end
