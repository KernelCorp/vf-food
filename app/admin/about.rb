#encoding: utf-8
ActiveAdmin.register About do
  permit_params :name, :text, :attachment, seo_attributes: [:title, :description, :keywords]

  config.filters = false

  index do
    selectable_column
    column :name
    column :text do |about|
      raw about.text
    end
    default_actions
  end

  show do |about|
    attributes_table do
      row :name
      row :text do
        raw about.text
      end
      row :attachment do
        image_tag(about.attachment.url(:thumb))
      end
    end

    panel 'SEO' do
      table_for about.seo, i18n: ActsAsPage::Seo do
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
