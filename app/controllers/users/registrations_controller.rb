# -*- encoding : utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController
	skip_before_filter :require_no_authentication

	before_filter :authenticate_user!, :only => [:new, :create]
	before_filter :only_admin, :only => [:new, :create]

	def new
		@organizations = Admin::Organization.all
  		super
	end

	def create
		@org = Admin::Organization.find(params[:user][:organization_id])
		
		@user = @org.users.create(params[:user])
		@user.is_admin = false

		if @user.save
			redirect_to root_path, 
				:notice => 'Novo representante adicionado com sucesso'
		else
	  		render :action => "new", :notice => 'erro'
		end
	end

	private
	def only_admin

		if current_user == nil
			redirect_to root_path, :notice => "Acesso negado" 
		elsif !current_user.is_admin
			redirect_to root_path, :notice => "Acesso negado"  
		end

	end

end
