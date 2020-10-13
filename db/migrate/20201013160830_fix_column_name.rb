class FixColumnName < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :events, :article_id, :organization_id
    rename_column :comments, :article_id, :organization_id
  end
end
