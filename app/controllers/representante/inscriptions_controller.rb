# -*- encoding : utf-8 -*-
class Representante::InscriptionsController < ApplicationController

	def index
		@athletes = Representante::Athlete.where(
			:organization_id => current_user.organization.id)
		@competitions = Admin::Competition.all
	end

	def inscrever
		@athletes = Representante::Athlete.where(
			:organization_id => current_user.organization.id)
		@competition = Admin::Competition.find(params[:id])
	end

	def efetuar_inscricao
		@competition = Admin::Competition.find(params[:id])

		if (not params[:competition].nil?) &&
			(params[:competition][:athletes_ids].count > @competition.max_per_org)
			flash[:notice] = "Apenas #{@competition.max_per_org} atletas são permitidos nessa competição"
	    	redirect_to :back
	    	return
	    end

		respond_to do |format|

			@competition.athletes.delete_if {|atl| atl.organization.id == current_user.organization.id}

			if (not params[:competition].nil?)

				params[:competition][:athletes_ids].each do |id|
					atl = Representante::Athlete.find(id)
					@competition.athletes << atl
				end

			end

	    	format.html { redirect_to :back, notice: 'Inscrição atualizada.' }
	    end
	end

end
