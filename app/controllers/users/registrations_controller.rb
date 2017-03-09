class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]
before_action :get_user

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
    #  super
    @user = User.new(inscription_params)
    #@user.active = true
    set_minimum_password_length
    if @user.save
      flash[:success] = "Inscrição realizada com sucesso."
      redirect_to authenticated_user_root_path

    else
      flash[:error] = "Ocorreu um erro e não foi possível completar sua inscrição"
      redirect_to new_user_registration_path
   end
end
  # GET /resource/edit
  # Modificar isso aqui depois, para que o ususário
  # possa editar algum dado como nome e talz

  # def edit
  #   super
  # end

  # PUT /resource
   def update

      respond_to do |format|
        if @user.save && @user.update_attributes(inscription_params)
          flash[:success] = "Dados atualizados"
          format.html{ redirect_to authenticated_user_root_path}
        else
          format.html { render 'edit'}
          format.json{ render json: @user.errors} #Acho que essa parte
                                                  #manda as mensganes de erro in page
        end
      end
   end



   def update_password
     if @user.valid_password?(params[:user][:current_password])
       if @user.update(password_params)
         # Sign in the user by passing validation in case their password changed
         sign_in @user, :bypass => true
         flash[:success] = "Senha alterada com sucesso."
         redirect_to authenticated_user_root_path
       else
         flash[:error] = "Não foi possível alterar sua senha."
         redirect_to password_edit_path
       end
     else
       flash[:error] = "Senha atual incorreta."
       redirect_to password_edit_path
     end


   end



  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  private


  def inscription_params
    params.require(:user).permit(
     :name,
     :email,
     :password,
     :rg,
     :cpf,
     :birthdate,
     :gender,
     :cep,
     :address,
     :address_number,
     :address_complement,
     :neighborhood,
     :city,
     :phone,
     :cel,
     :educational_institution,
     :registration_number,
     :semester,
     :fb_link
    )
  end

  def password_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end





  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
