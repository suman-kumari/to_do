ActiveAdmin.register User do
  menu :parent => "Menu", :priority => 1
  config.sort_order = "id_asc"
  config.per_page = 5
  filter :first_name
  
  member_action :todo do
    user = User.find(params[:id])
    user.todos
  end
  
  form do |f|
    f.inputs "Sign up" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index :download_links => false do
    column :id
    column :first_name
    column :last_name
    column :email
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :created_at
      row :updated_at
    end
  end
  
  controller do
    def permitted_params
      params.permit user: [:first_name, :last_name, :email, :password, :password_confirmation]
    end
  end
  
end
