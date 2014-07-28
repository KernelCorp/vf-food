#encoding: utf-8
ActiveAdmin.register MasterClass do
  permit_params :name, :text, :attachment, seo_attributes: [:title, :description, :keywords]

  config.filters = false

  index do
    selectable_column
    column :name
    column :text do |master_class|
      raw master_class.text
    end
    default_actions
  end

  show do |master_class|
    attributes_table do
      row :name
      row :text do
        raw master_class.text
      end
      row :attachment do
        image_tag(master_class.attachment.url(:thumb))
      end
    end

    panel 'SEO' do
      table_for master_class.seo, i18n: ActsAsPage::Seo do
        column :title
        column :description
        column :keywords
      end
    end
  end

  form do |f|
    f.inputs 'Страница' do
      f.input :name
      f.input :text, as: :text
      f.input :attachment, as: :file
    end
    f.inputs 'SEO', for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
    f.actions
  end

end
