class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.references :location
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
