ActiveAdmin.register Customer do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :phone_number, :email_address, :notes
  permit_params :full_name, :phone_number, :email_address, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email_address, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), size: "200x200"
        else
          "No image uploaded"
        end
      end
    end
  end

end
