class CreateProductionProcesses < ActiveRecord::Migration[6.1]
  def change
    create_table :production_processes do |t|

      t.string :name, null:false
      t.timestamps
    end
  end
end
