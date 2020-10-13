class ChangeArticlesTableNameToOrganizations < ActiveRecord::Migration[6.0]
  def change
    rename_table :articles, :organizations
    end
end
