ActiveAdmin.register Pendency do
  includes :user
  actions :all, :except => [:edit, :destroy]

  member_action :settle, method: :put do
    resource.settle!
    redirect_to admin_pendency_path(resource)
  end

  action_item only: :show do
    @pendency = Pendency.find(params[:id])
    link_to 'Quitar', settle_admin_pendency_path(pendency), method: :put if @pendency.unsettled?
  end

  permit_params :user_id, :date, :settled

  scope "Acertados", :settled
  scope "Pendentes", :unsettled

  index do
    column "Apelido" do |pendency|
      link_to pendency.user.nickname, admin_user_path(pendency.user), target: "_blank"
    end
    column "Nome Completo" do |pendency|
      pendency.user.full_name
    end
    column :date
    column :settled
    actions
  end

  filter :date
  filter :settled
  filter :user_full_name_cont, label: "Nome Completo"

  show do
    attributes_table do
      row :date
      row "Apelido" do |pendency|
        link_to pendency.user.nickname, admin_user_path(pendency.user), target: "_blank"
      end
      row "Nome Completo" do |pendency|
        pendency.user.full_name
      end
      row "Sexo" do |pendency|
        pendency.user.sex.text
      end
      row :settled
    end
  end

  form do |f|
    f.inputs do
      f.input :user, collection: User.where.not(full_name: nil)
      f.input :date, as: :date_time_picker,
                          picker_options: {
                            max_date: Date.current,
                            timepicker: false
                          }
    end
    f.actions
  end
end
