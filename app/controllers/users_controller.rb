class UsersController < BaseController
  before_action :set_user, only: %i[show edit update]
  before_action :authenticate_user!

  def show
    authorize @user
  end

  def edit
    authorize @user
    build @user
  end

  def update
    authorize @user
    @user.assign_attributes(user_params)
    @user.last_update_at = Time.now

    respond_to do |format|
      if @user.save
        @user.update! if @user.need_review? || @user.unfilled?
        format.html { redirect_to @user }
      else
        build @user
        format.html { render :edit }
      end
    end
  end

  private

  def build user
    user.health_insurances.build if user.health_insurances.blank?
    user.emergency_contacts.build if user.emergency_contacts.blank?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :full_name, :nickname, :rg, :cpf, :birth, :zip_code,
                                 :state, :city, :neighborhood, :address, :number,
                                 :email, :secondary_email, :phone, :home_phone, :another_phone,
                                 :facebook_link, :whatsapp, :injuries_history, :drug_restrictions,
                                 :has_health_insurance, :chronic_diseases, :sex,
                                 :donation_availability, :complement, :blood_type,
                                 :agree_with_terms_of_statute, :agree_with_terms_of_athlete_manual,
                                 training_availability: [],
                                 emergency_contacts_attributes: %i[
                                   id
                                   full_name
                                   kinship_degree
                                   home_phone
                                   phone
                                   observation
                                 ],
                                 health_insurances_attributes: %i[
                                   id
                                   company
                                   plan
                                   card_number
                                   validity
                                   preferably_hospital
                                   _destroy
                                 ])
  end
end
