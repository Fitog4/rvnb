class AddPropertiesToRv < ActiveRecord::Migration[5.2]
  def change
    add_column :rvs, :travelling_seats, :integer
    add_column :rvs, :beds, :integer
    add_column :rvs, :available_in, :string
    add_column :rvs, :available_from, :datetime
    add_column :rvs, :available_till, :datetime
  end
end
