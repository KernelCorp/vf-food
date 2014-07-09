ActiveAdmin.register Consulting do

  controller do
    include ImageRowUploader
  end

  permit_params :name, :text, seo_attributes: [:title, :description, :keywords]

  config.filters = false

  member_action :add_files, :method => :post do
    @consulting = Consulting.find params[:id]
    @image = @consulting.images.build(attachment: @raw_file)

    if @image.save
      render json: { success: true, :url => @image.attachment.url(:thumb), :id => @image.id }
    else
      render json: { success: false }
    end
  end
  member_action :delete_file, :method => :delete do
    @consulting = Consulting.find params[:parent_id]

    if @consulting.images.where(id: params[:image_id]).delete
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  index do
    selectable_column
    column :name do |consulting|
      link_to consulting.name, consulting_path(consulting)
    end
    column :text
    default_actions
  end

  show do |consulting|
    attributes_table do
      row :name
      row :text
      row :title do |seo|
        consulting.seo.title
      end
      row :description do |seo|
        consulting.seo.description
      end
      row :keywords do |seo|
        consulting.seo.keywords
      end
    end
    render 'admin/consulting/form_add_images'
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :text, as: :text
    end
    f.inputs 'SEO', for: [:seo, f.object.seo] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
    f.actions
  end
  
end
