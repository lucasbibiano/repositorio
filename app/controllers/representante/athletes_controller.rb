# -*- encoding : utf-8 -*-
class Representante::AthletesController < ApplicationController

  before_filter :only_rep
  before_filter :same_org, :only => [:show, :edit, :update, :destroy]

  # GET /representante/athletes
  # GET /representante/athletes.json
  def index
    @representante_athletes = current_user.organization.athletes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @representante_athletes }
    end
  end

  # GET /representante/athletes/1
  # GET /representante/athletes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @representante_athlete }
    end
  end

  # GET /representante/athletes/new
  # GET /representante/athletes/new.json
  def new
    @representante_athlete = Representante::Athlete.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @representante_athlete }
    end
  end

  # GET /representante/athletes/1/edit
  def edit
  end

  # POST /representante/athletes
  # POST /representante/athletes.json
  def create
    @representante_athlete = Representante::Athlete.new(params[:representante_athlete])
    @representante_athlete.organization = current_user.organization

    respond_to do |format|
      if @representante_athlete.save
        format.html { redirect_to @representante_athlete, notice: 'Athlete was successfully created.' }
        format.json { render json: @representante_athlete, status: :created, location: @representante_athlete }
      else
        format.html { render action: "new" }
        format.json { render json: @representante_athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /representante/athletes/1
  # PUT /representante/athletes/1.json
  def update
    respond_to do |format|
      if @representante_athlete.update_attributes(params[:representante_athlete])
        format.html { redirect_to @representante_athlete, notice: 'Athlete was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @representante_athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /representante/athletes/1
  # DELETE /representante/athletes/1.json
  def destroy
    @representante_athlete = Representante::Athlete.find(params[:id])
    @representante_athlete.destroy

    respond_to do |format|
      format.html { redirect_to representante_athletes_url }
      format.json { head :no_content }
    end
  end

  private

  def only_rep

    if current_user == nil
      redirect_to root_path, :notice => "Acesso negado" 
    elsif current_user.is_admin
      redirect_to root_path, :notice => "Acesso negado"  
    end

  end

  def same_org
    @representante_athlete = Representante::Athlete.find(params[:id])

    if current_user.organization != @representante_athlete.organization
      redirect_to representante_athletes_url, :notice => "Acesso negado"
    end
    
  end
end
