ActiveAdmin.register User do
  permit_params :email, :company_id, :password, :password_confirmation

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
      super
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :company
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
    f.inputs 'Company' do
      f.input :company
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :company
      row :created_at
      row :updated_at
    end
    panel 'Authentication Tokens' do
      table_for user.authentication_tokens.reorder(last_used_at: :desc) do
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
