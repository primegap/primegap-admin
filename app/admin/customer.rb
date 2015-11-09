ActiveAdmin.register Customer do
  permit_params :email, :full_name, :first_name, :last_name, :phone

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :phone
    column :created_at
    actions
  end

  filter :email
  filter :full_name

  form do |f|
    f.inputs 'Admin Details' do
      f.input :full_name
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
    end
    f.actions
  end
end
