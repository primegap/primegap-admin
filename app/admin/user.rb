ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :created_at
      row :updated_at
    end
    panel 'Authentication Tokens' do
      table_for user.authentication_tokens do
        column :body
        column :last_used_at
        column :ip_address
        column :user_agent
        column :created_at
        column :updated_at
      end
    end
    active_admin_comments
  end
end
