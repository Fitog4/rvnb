class AddCoordinatesToRvs < ActiveRecord::Migration[5.2]
  def change
    add_column :rvs, :latitude, :float
    add_column :rvs, :longitude, :float
  end
end
