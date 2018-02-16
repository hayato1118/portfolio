class CreateOsVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :os_versions do |t|
      t.string :version_number

      t.timestamps
    end
  end
end
