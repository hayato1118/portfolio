class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :message
      t.string :name
      t.string :contact_image_id
      t.string :nick_name
      t.string :email
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
