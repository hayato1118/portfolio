class RemoveContactImageIdFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :contact_image_id, :string
  end
end
