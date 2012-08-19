class Representante::AthletesController < ApplicationController
  # GET /representante/athletes
  # GET /representante/athletes.json
  def index
    @representante_athletes = Representante::Athlete.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @representante_athletes }
    end
  end

  # GET /representante/athletes/1
  # GET /representante/athletes/1.json
  def show
    @representante_athlete = Representante::Athlete.find(params[:id])

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
    @representante_athlete = Representante::Athlete.find(params[:id])
  end

  # POST /representante/athletes
  # POST /representante/athletes.json
  def create
    @representante_athlete = Representante::Athlete.new(params[:representante_athlete])

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
    @representante_athlete = Representante::Athlete.find(params[:id])

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
end
