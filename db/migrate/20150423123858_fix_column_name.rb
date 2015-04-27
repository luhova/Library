class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :books, :discription, :description
  end
end
