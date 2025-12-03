class CreateCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.integer :user_id
      t.string :picture_url

      t.timestamps
    end
  end
end
