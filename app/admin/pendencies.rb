ActiveAdmin.register Pendency do
  includes :user

  permit_params :user_id, :date, :settled

  scope "Acertados", :settled
  scope "Pendentes", :unsettled

  index do
    column :user_full_name
    column :date
    column :settled
    actions
  end

  filter :date
  filter :settled
  filter :user_full_name_cont

  show do
    attributes_table do
      row :full_name
      row :nickname
      row :sex
      row :rg
      row :cpf
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :date
      f.input :settled
    end
    f.actions
  end
end
