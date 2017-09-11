class ChangeColumnToProgresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :progresses, :business_category
    rename_column :progresses, :occupation_category, :occupation_category_id
  end
end
