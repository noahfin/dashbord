class AddTypeToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :type, :string
  end
end
