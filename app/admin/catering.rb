#encoding: utf-8
ActiveAdmin.register Catering do
  permit_params :name, :text, :attachment,
    seo_attributes: [:title, :description, :keywords],
    dishes_attributes: [:id, :name, :description, :cost],
    menu_attributes: [:name, :description, :price, sections_attributes: [:id, :name, :text, :_destroy]]

  config.filters = false

  controller do
    include ImageRowUploader
  end
  member_action :add_files, :method => :post do
    @catering = Catering.find params[:id]
    @image = @catering.images.build(attachment: @raw_file)

    if @image.save
      render json: { success: true, :url => @image.attachment.url(:thumb), :id => @image.id }
    else
      render json: { success: false }
    end
  end
  member_action :delete_file, :method => :delete do
    @catering = Catering.find params[:parent_id]

    if @catering.images.where(id: params[:image_id]).delete
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  index do
    selectable_column
    column :name
    column :text do |catering|
      raw catering.text
    end
    default_actions
  end

  show do |catering|
    attributes_table do
      row :name
      row :text do
        raw catering.text
      end
      row :attachment do
        image_tag(catering.attachment.url(:thumb))
      end
    end

    panel 'SEO' do
      table_for catering.seo, i18n: ActsAsPage::Seo do
        column :title
        column :description
        column :keywords
      end
    end

    panel 'Меню' do
      table_for catering.menu, i18n: Menu do
        column :name
        column :description
        column :price
      end
      table_for catering.menu.sections, i18n: Section do
        column :name
        column :text
      end
    end

    render 'admin/caterings/form_add_images'
  end

  form do |f|
    f.inputs 'Страница' do
      f.input :name
      f.input :text
      f.input :attachment, as: :file
    end
    f.inputs 'SEO', for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end

    f.inputs 'Меню', for: [:menu, f.object.menu] do |menu|
      menu.input :name
      menu.input :description, as: :text, input_html: { rows: 3 }
      menu.input :price
      menu.has_many :sections, allow_destroy: true do |section|
        section.input :name
        section.input :text
      end
    end

    f.actions
  end

end
