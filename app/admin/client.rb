ActiveAdmin.register Client do
  permit_params :name, :link, :attachment

  config.filters = false

  index do
    selectable_column
    column :name
    column :link do |client|
      link_to client.link, client.link
    end
    default_actions
  end

  show do |client|
    attributes_table do
      row :name
      row :link do
        link_to client.link, client.link
      end
      row :attachment do
        image_tag(client.attachment.url(:original))
      end
    end
  end

  form do |f|
    f.inputs 'Данные' do
      f.input :name
      f.input :link
      f.input :attachment, as: :file
    end
    f.actions
  end

end
