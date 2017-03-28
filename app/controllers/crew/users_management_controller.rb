class Crew::UsersManagementController < ApplicationController
  before_action :load_user, only: [:edit, :update]
  # before_action :get_user

    def index
      @users= User.all.order('name ASC')
    end

    def edit
    #   @payment = @user.payment
    #   @lots = Lot.all
    #   @user_lot = @user.lot unless @user.lot.nil?
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to  crew_edit_user_path(@user), notice: "Usuário atualizado com sucesso."
      else
        flash[:error] = "Erro ao atualizar cadastro, verique os campos obrigatórios."
        redirect_to  crew_edit_user_path(@user)
      end
    end

    def qualified
      @users = User.allocated
    end

    def waiting_list
      # @users = User.eligible
      # @list = true
      #
      # @lot = Lot.active_lot
      # if !@lot.nil? && !@lot.is_full?
      #   @lot_active = @lot
      # else
      #   flash[:notice] = "Não há lotes abertos. Crie ou edite um lote."
      # end
    end

    def disqualified
      @users = User.disqualified
    end

    # def pays_list
    #   @users = User.pays
    # end

    # def ejs_list
    #   #patrickeeeeeeeeee
    #   @ej = User.all.where.not(junior_enterprise:nil).order(:junior_enterprise).group_by{|d| d.junior_enterprise.split(' ').first.downcase}
    #   #@ej.each do |ej|
    #   # split_part = postgre   substring_index = mysql
    #   @users = User.where("lower(split_part(junior_enterprise, ' ', 1)) = ?", "#{params[:ej]}")
    #   @users_l = params[:ej].nil? ? User.allocated : @users
    #   #junior_enterprise group('name AS grouped_name, age')
    # end

    private
    def load_user
        @user = User.find(params[:format])
    end

    def user_params
    #3  @user = User.find(params[:format])
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
       :fb_link)

    end
  end
