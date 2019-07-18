ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :body

  index do
    column :d
    column :author do |post|
      post.user.email
    end
      column :title
      column :comments do |post|
        post.comments.count
      end
    actions
  end
  form do |f|
    inputs 'Agregar Nuevo Post' do
      f.input :user_id,
      label: 'Author',
      as: :select,
      collection: User.pluck(:email, :id)
      input :title
      input :body
      end
    actions
  end
  filter :created_at
end
