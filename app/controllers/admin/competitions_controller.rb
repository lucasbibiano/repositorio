# -*- encoding : utf-8 -*-
class Admin::CompetitionsController < ApplicationController

  before_filter :only_admin

  # GET /admin/competitions
  # GET /admin/competitions.json
  def index
    @admin_competitions = Admin::Competition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_competitions }
    end
  end

  # GET /admin/competitions/1
  # GET /admin/competitions/1.json
  def show
    @admin_competition = Admin::Competition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_competition }
    end
  end

  # GET /admin/competitions/new
  # GET /admin/competitions/new.json
  def new
    @admin_competition = Admin::Competition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_competition }
    end
  end

  # GET /admin/competitions/1/edit
  def edit
    @admin_competition = Admin::Competition.find(params[:id])
  end

  # POST /admin/competitions
  # POST /admin/competitions.json
  def create
    @admin_competition = Admin::Competition.new(params[:admin_competition])

    respond_to do |format|
      if @admin_competition.save
        format.html { redirect_to admin_competitions_url, notice: 'Competição cadastrada com sucesso' }
        format.json { render json: @admin_competition, status: :created, location: @admin_competition }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/competitions/1
  # PUT /admin/competitions/1.json
  def update
    @admin_competition = Admin::Competition.find(params[:id])

    respond_to do |format|
      if @admin_competition.update_attributes(params[:admin_competition])
        format.html { redirect_to admin_competitions_url, notice: 'Competição atualizada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/competitions/1
  # DELETE /admin/competitions/1.json
  def destroy
    @admin_competition = Admin::Competition.find(params[:id])
    @admin_competition.destroy

    respond_to do |format|
      format.html { redirect_to admin_competitions_url, notice: 'Competição apagada com sucesso' }
      format.json { head :no_content }
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
