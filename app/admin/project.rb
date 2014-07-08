ActiveAdmin.register Project do
  permit_params :name, :text, seo_attributes: [:title, :description, :keywords]

  config.filters = false

  member_action :add_files, :method => :post do
    @project = Project.find params[:id]
    @image = @project.images.build(attachment: @raw_file)

    if @image.save
      render json: { success: true, :url => @image.attachment.url(:thumb), :id => @image.id }
    else
      render json: { success: false }
    end
  end
  member_action :delete_file, :method => :delete do
    @project = Project.find params[:project_id]

    if @project.images.where(id: params[:image_id]).delete
      render json: { success: true }
    else
      render json: { success: false }
    end

  end

  index do
    selectable_column
    column :name do |project|
      link_to project.name, project_path(project)
    end
    column :text
    default_actions
  end

  show do |project|
    attributes_table do
      row :name
      row :text
      row :title do |seo|
        project.seo.title
      end
      row :description do |seo|
        project.seo.description
      end
      row :keywords do |seo|
        project.seo.keywords
      end
    end
    render 'admin/projects/form_add_images'
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

  controller do
    before_filter :parse_raw_upload, :only => [:add_files]

    private

    def parse_raw_upload
      if env['HTTP_X_FILE_UPLOAD'] == 'true'
        @raw_file = env['rack.input']
        @raw_file.class.class_eval { attr_accessor :original_filename, :content_type }
        @raw_file.original_filename = env['HTTP_X_FILE_NAME']
        @raw_file.content_type = env['HTTP_X_MIME_TYPE']
        if @raw_file.class.name == 'Unicorn::TeeInput'
          @raw_file = Paperclip::StringioAdapter.new(@raw_file)
        end
      end
    end

  end
  
end
