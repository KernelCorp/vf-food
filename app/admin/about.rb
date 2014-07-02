ActiveAdmin.register About do
  permit_params :name, :text, :seo, :title, :description, :keywords

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
      row :title do |seo|
        about.seo.title
      end
      row :description do |seo|
        about.seo.description
      end
      row :title do |seo|
        about.seo.keywords
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :text
    end
    f.inputs "SEO", for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
    f.actions
  end

end
