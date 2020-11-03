class AddZipcodeToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :zipcode, :string
  end
end
