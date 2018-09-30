ActiveAdmin.register User do
  includes :emergency_contacts, :health_insurances
  actions :all, except: :destroy

  permit_params :email, :password, :nickname

  index do
    column :full_name
    column :nickname
    column :email
    column "Sexo" do |user|
      if user.sex.present?
        I18n.t("abbreviations.sex.#{user.sex}")
      else
        user.sex
      end
    end
    column "Telefone" do |user|
      user.phone || user.home_phone || user.another_phone
    end
    column "Plano" do |user|
      user.has_health_insurance
    end
    column "Mensalidades" do |user|
      if user.pendencies.unsettled.any?
        span "Inadimplente"
      else
        span "Ok"
      end
    end
    column "Cadastro" do |user|
      I18n.t("activerecord.attributes.user.#{['aasm_state', user.aasm_state].compact.join('/')}")
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :nickname
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  filter :full_name
  filter :nickname
  filter :sex
  filter :has_health_insurance
  filter :aasm_state, as: :check_boxes, collection: User.aasm.states_for_select, label: "Cadastro"

  show title: :nickname do
    attributes_table title: "Atleta" do
      row :full_name
      row :nickname
      row "Sexo" do |user|
        I18n.t("enumerize.user.sex.#{user.sex}")
      end
      row :rg
      row :cpf
      row :birth
      row "Endereço" do |user|
        para [
          [user.address, user.number, user.complement].compact.join(', '),
          user.neighborhood
        ].compact.join(' - ')
        para [user.city, user.state, user.zip_code].compact.join(' - ')
      end
    end

    attributes_table title: "Dados para contato" do
      row :email
      row :secondary_email
      row :phone
      row :home_phone
      row :another_phone
      row :facebook_link
      row :whatsapp
    end

    attributes_table title: "Dados de atleta" do
      row :injuries_history
      row :drug_restrictions
      row :chronic_diseases
      row "Disponibilidade para treino" do |user|
        user.training_availability.map(&:text).join(", ")
      end
      row "Disponibilidade para mensalidade" do |user|
        user.donation_availability.text
      end
      row :has_health_insurance

      if user.health_insurances.any?
        health_insurance = user.health_insurances.last
        row "Plano de saúde" do |user|
          "#{health_insurance.company}\n".concat(
            "#{health_insurance.card_number} - #{health_insurance.validity}")
        end
        row "Hospital preferencial" do |user|
          health_insurance.preferably_hospital
        end
      end

      user.emergency_contacts.each do |emergency_contact|
        row "Contato de emergência" do |user|
          "#{emergency_contact.kinship_degree}: ".concat(
            "#{emergency_contact.full_name} - ").concat(
            "#{ [
              emergency_contact.phone,
              emergency_contact.home_phone
            ].compact.join(" / ") }")
        end
      end
    end

    attributes_table title: "Dados do cadastro" do
      row "Cadastro" do |user|
        I18n.t("activerecord.attributes.user.#{['aasm_state', user.aasm_state].compact.join('/')}")
      end
      row :created_at
      row :updated_at
      row :sign_in_count
      row :confirmed_at
      row :last_sign_in_at
    end
  end
end
