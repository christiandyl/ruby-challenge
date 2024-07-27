class UserReflex < ApplicationReflex
  before_reflex do
    @user = GlobalID::Locator.locate_signed(element.dataset.signed_id)
  end

  def save
    @user.attributes = user_params

    unless @user.save
      morph(
        "##{ActionView::RecordIdentifier.dom_id(@user, :edit)}",
        render(partial: "user/form", locals: { user: @user })
      )
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :middle_name,
      :phone_number,
      :email,
      :social_security_number,
      :country,
      :other_country,
      :address,
      :city,
      :state,
      :zip_code,
    )
  end
end
