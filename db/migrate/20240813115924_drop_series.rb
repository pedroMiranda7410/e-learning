class DropSeries < ActiveRecord::Migration[7.0]
  def change
    drop_table :series
  end
end
