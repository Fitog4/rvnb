class CreateRvs < ActiveRecord::Migration[5.2]
  def change
    create_table :rvs do |t|
      t.string :category
      t.references :user

      t.timestamps
    end
  end
end
