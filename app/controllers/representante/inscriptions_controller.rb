# -*- encoding : utf-8 -*-
class Representante::InscriptionsController < ApplicationController

	def index
		@athletes = Representante::Athlete.where(
			:organization_id => current_user.organization.id)
		@competitions = Admin::Competition.all
	end

	def inscrever_atleta_competicao
		@competetition = Competition.find(params[:competition_id])
		@athlete = Atleta.find(params[:athlete_id])

		if @athlete.can_join(@competetition) #detectar maximo aqui de atletas
			@competicao.athletes << @atleta
		end

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
			flash[:notice] = "Tsc Tsc"
			@competition.errors.add(:max_per_org,
			 "Apenas #{@competition.max_per_org} atletas são permitidos nessa competição")
	    	redirect_to :back
	    	return
	    end

		respond_to do |format|

			#@competition.athletes.where(
			#	:organization_id => current_user.organization.id) do |atl|
			#	atl.competitions.delete(@competition)
			#end

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
