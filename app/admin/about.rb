ActiveAdmin.register About do
  permit_params :name, :text, seo_attributes: [:title, :description, :keywords]

  config.filters = false

  index do
    selectable_column
    column :name
    column :text
    default_actions
  end

  show do |about|
    attributes_table do
      row :name
      row :text
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
      f.input :text
    end
    f.inputs 'SEO', for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
    f.actions
  end

end
