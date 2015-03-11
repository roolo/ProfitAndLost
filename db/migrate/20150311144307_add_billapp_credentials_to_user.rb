class AddBillappCredentialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :billapp_subdomain,  :text
    add_column :users, :billapp_username,   :text
    add_column :users, :billapp_userpass,   :text
  end
end
