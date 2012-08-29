# -*- encoding : utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController
	skip_before_filter :require_no_authentication

	before_filter :authenticate_user!, :only => [:new, :create, :destroy]
	before_filter :only_admin, :only => [:new, :create, :destroy]

	def new
		@organizations = Admin::Organization.all
  		super
	end

	def create
		@org = Admin::Organization.find(params[:user][:organization_id])
		
		senha = gerar_senha

		@user = @org.users.new(params[:user])
		@user.is_admin = false
		@user.password = senha
		@user.password_confirmation = senha

		if @user.save
			UserMailer.tell_user(@user).deliver

			redirect_to root_path, 
				:notice => 'Novo representante adicionado com sucesso'
		else
			@organizations = Admin::Organization.all
	  		render :action => "new", :notice => 'erro'
		end
	end

	def destroy
		if (params[:id] == "sign_out")
			super
			return
		end

		User.find(params[:id]).destroy
		flash[:notice] = "Representante deletado com sucesso"
		redirect_to admin_representantes_path and return
	end

	#serio nao mexer aqui, ta deixando apagar os usuarios de algum jeito misterioso
	#nao mexer daqui pra baixo
	def resource_name
    	:user
  	end

  	def resource
    	@resource ||= User.new
  	end

  	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
  	end
  	# nao mexer daqui pra cima


	private
	def only_admin

		if current_user == nil
			redirect_to root_path, :notice => "Acesso negado" 
		elsif !current_user.is_admin
			redirect_to root_path, :notice => "Acesso negado"  
		end

	end

	def gerar_senha
		('a'..'z').to_a.shuffle[0,8].join
	end

end
