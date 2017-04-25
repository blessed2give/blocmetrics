class AddNameToRegisteredApplications < ActiveRecord::Migration
  def change
    add_column :registered_applications, :name, :string
  end
end
