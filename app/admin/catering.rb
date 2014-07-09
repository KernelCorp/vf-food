ActiveAdmin.register Catering do
  permit_params :name, :text, 
    seo_attributes: [:title, :description, :keywords],
    dishes_attributes: [:id, :name, :description, :cost]

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
    column :text
    default_actions
  end

  show do |catering|
    attributes_table do
      row :name
      row :text
    end

    panel 'SEO' do
      table_for catering.seo, i18n: ActsAsPage::Seo do
        column :title
        column :description
        column :keywords
      end
    end

    panel 'Блюда' do
      table_for catering.dishes, i18n: Dish do
        column :name
        column :description
        column :cost
      end
    end
    render 'admin/caterings/form_add_images'
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
    f.has_many :dishes, allow_destroy: true do |dish|
      dish.input :name
      dish.input :description, as: :text, input_html: { rows: 3 }
      dish.input :cost
    end
    f.actions
  end

end
