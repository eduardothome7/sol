class CreateAdminSites < ActiveRecord::Migration[8.1]
  def change
    create_table :admin_sites do |t|
      t.string :title
      t.string :logo
      t.string :cnpj

      t.timestamps
    end
  end
end
