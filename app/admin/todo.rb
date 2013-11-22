ActiveAdmin.register Todo do
  menu :parent => "Menu"
  config.sort_order = "id_asc"
  config.comments = false

  form do |f|
    f.inputs "Todo Details" do
      f.input :user, :as => :select, :collection => User.all.collect{ |u| [u.first_name.titleize, u.id] }, :prompt => "select user"
      f.input :title
      f.input :description
      f.input :privacy, :as => :select, :prompt => "select privacy"
      f.input :completed
      f.input :start_date_time
      f.input :end_date_time
    end
    f.actions
  end
  
  index :download_links => false do
    column :id
    column :user_id
    column :title
    column :description
    column :privacy 
    column :completed
    column :start_date_time
    column :end_date_time
    actions
  end
 
  show do |todo|
    attributes_table do
      row :id
      row :title
      row :description
      row :privacy
      row :completed
      row :start_date_time
      row :end_date_time
    end
  end

  sidebar :help, :only => :index do
    "Need help? Email us at help@example.com"
  end

  controller do
    def permitted_params
      params.permit todo: [:user_id, :title, :description, :privacy, :completed, :start_date_time, :end_date_time]
    end
  end
    filter :user, :as => :select, :collection => User.all.collect{ |u| [u.first_name.titleize, u.id] }, :prompt => "select user"
end
