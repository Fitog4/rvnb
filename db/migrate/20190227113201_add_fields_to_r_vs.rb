class AddFieldsToRVs < ActiveRecord::Migration[5.2]
  def change
    add_column :rvs, :price_per_night, :integer
    add_column :rvs, :model, :string
  end
end
