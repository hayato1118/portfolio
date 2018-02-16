class CreateOperatingsystems < ActiveRecord::Migration[5.1]
  def change
    create_table :operatingsystems do |t|
      t.string :operatingsystem_name

      t.timestamps
    end
  end
end
