ActiveAdmin.register Myfile do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :filename, :status, :file_att, :created_at, :updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:filename, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do 
    selectable_column
    id_column
    column :filename
    column :status
    column "File Attachment" do |file|
      f = Myfile.find(file.id)
      if f.file_att.attached?
        image_tag url_for(f.file_att),width:300,height:240
      else
        "empty"
      end
    end
    column :created_at
    actions
  end


  action_item :remove_image, only: :show do
    link_to "Remove Image", remove_image_admin_myfile_path(myfile), method: :put if myfile.file_att.attached?
  end
  member_action :remove_image, method: :put do
    myfile = Myfile.find(params[:id])
    myfile.file_att.detach
    myfile.save()
    redirect_to admin_myfile_path(myfile)
  end



  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :filename
      f.input :status
      f.input :file_att, as: :file, required: false
    end
    f.actions
  end

  show do
    attributes_table do
      row :filename
      row :status
      row :image do |ad|
        image_tag url_for(myfile.file_att),width:300,height:240
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  
end

#f.input :uploads, as: :file, required: false
