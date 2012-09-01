# -*- encoding : utf-8 -*-
class Admin::RepresentantesController < ApplicationController

	before_filter :only_admin

	def index
		@admin_representantes = User.where(:is_admin => false)

		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @admin_representantes }
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
