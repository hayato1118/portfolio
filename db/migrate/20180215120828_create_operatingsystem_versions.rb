class CreateOperatingsystemVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :operatingsystem_versions do |t|
      t.integer :operatingsystem_id
      t.integer :os_version_id

      t.timestamps
    end
  end
end
