class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
#    add_column :users, :name, :string
#    add_column :users, :email, :string
    add_column :users, :rg, :string
    add_column :users, :cpf, :string
    add_column :users, :birthdate, :datetime
    add_column :users, :gender, :string
#    add_column :users, :address, :string
    add_column :users, :cep, :string
    add_column :users, :address, :string
    add_column :users, :address_number, :string
    add_column :users, :address_complement, :string
    add_column :users, :neighborhood, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :cel, :string
    add_column :users, :educational_institution, :string
    add_column :users, :registration_number, :integer
    add_column :users, :semester, :integer
    add_column :users, :fb_link, :string
 



    
  end
end
