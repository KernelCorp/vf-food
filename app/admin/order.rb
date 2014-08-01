#encoding: utf-8
ActiveAdmin.register Order do
  permit_params :name, :phone, :email, :from, :text

  config.filters = false
  config.sort_order = 'id_desc'
  config.per_page = 50

  index do
    selectable_column
    column :created_at do |order|
      order.created_at.strftime t(:short, scope:[:date, :formats])
    end
    column :name
    column :phone
    column :from
    column :text
    default_actions
  end
  show do
    attributes_table do
      row :created_at
      row :updated_at
      row :name
      row :phone
      row :email
      row :from
      row :text
    end
  end
end