class Users::RegistrationsController < Devise::RegistrationsController

	def new
		@organizations = Admin::Organization.all
  		super
	end


	def create
		@org = Admin::Organization.find(params[:user][:organization_id])
		
		@user = @org.users.create(params[:user])

		if @user.save
			redirect_to root_path, 
				:notice => 'Novo representante adicionado com sucesso'
		else
	  		render :action => "new", :notice => 'erro'
		end
	end

end