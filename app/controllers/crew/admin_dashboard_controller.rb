class Crew::AdminDashboardController < Crew::BaseController
before_action :authenticate_crew_admin!
before_action :load_admin, only: [:edit, :update, :destroy]
before_action :get_admin

def manage_users
  @users = User.all
end

def manage_admin
  @admins = Admin.all
end


def create
  @admin = Admin.new(admin_params)
  if @admin.save
    redirect_to crew_admin_path, notice: "Admin criado com sucesso."
  else
    redirect_to crew_admin_path, alert: "Falha ao cadastrar novo admin."
  end
end

def read
end


def update

  if @admin.update(admin_params)
    redirect_to  crew_admin_path, notice: 'Atualizado com sucesso'
  else
    redirect_to  crew_admin_path, notice: 'Erro'
  end

end

def destroy

  name = @admin.name
  if @admin.destroy
    redirect_to crew_admin_path, notice: "O administrador #{name} foi excluído."
  else
    redirect_to crew_admin_path, notice: "Não foi possível excluir o administrador #{name}."
  end

end

private
def admin_params
  params[:confirmed_at] = Time.now
  params[:confirmation_sent_at] = Time.now
  params.require(:admin).permit(:name, :email, :password,
                                :password_confirmation, :confirmed_at,
                                :confirmation_sent_at)
end

def load_admin
  @admin = Admin.find(params[:id])
end

end
