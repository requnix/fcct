ActiveAdmin.register Member do
  index do
    selectable_column
    column :full_name
    column :position, &:position_list
    column :email
    column :member_since
    column :updated_at
    actions
  end

  scope 'Current', :active, default: true
  scope 'Past Members', :inactive

  scope 'Committee', :committee
  scope 'Marshals', :marshals

  form do |_|
    semantic_errors
    inputs 'Details' do
      input :email
      input :password
      input :first_name
      input :last_name
    end
    inputs 'Membership' do
      input :position_list
      input :member_since
      input :expires_at
    end
    actions
  end

  show do
    panel 'Member Details' do
      attributes_table_for member do
        row :full_name
        row :email
        row :position_list
        row('Committee') { |member| status_tag member.committee? }
        row('Marshal')   { |member| status_tag member.marshal?   }

        row :expires_at
        row :member_since

        row :updated_at
        row :created_at
      end
    end

    panel 'Authentication Details' do
      attributes_table_for member do
        row :reset_password_token
        row :reset_password_sent_at
        row :remember_created_at

        row :current_sign_in_at
        row :current_sign_in_ip

        row :last_sign_in_at
        row :last_sign_in_ip
      end
    end
  end

  permit_params :email, :password, :first_name, :last_name,
                :expires_at, :member_since, :position_list
end
