class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|
      t.integer :worker_id, null:false
      t.integer :product_id, null:false
      t.integer :product_count, null:false
      t.datetime :begin_time, null:false
      t.datetime :end_time
      t.timestamps
    end
  end
end
