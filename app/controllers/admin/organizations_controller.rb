# -*- encoding : utf-8 -*-
class Admin::OrganizationsController < ApplicationController

  before_filter :only_admin
  
  # GET /admin/organizations
  # GET /admin/organizations.json
  def index
    @admin_organizations = Admin::Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_organizations }
    end
  end

  # GET /admin/organizations/new
  # GET /admin/organizations/new.json
  def new
    @admin_organization = Admin::Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_organization }
    end
  end

  # GET /admin/organizations/1/edit
  def edit
    @admin_organization = Admin::Organization.find(params[:id])
  end

  # POST /admin/organizations
  # POST /admin/organizations.json
  def create
    @admin_organization = Admin::Organization.new(params[:admin_organization])

    respond_to do |format|
      if @admin_organization.save
        format.html { redirect_to @admin_organization, notice: 'Organization was successfully created.' }
        format.json { render json: @admin_organization, status: :created, location: @admin_organization }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/organizations/1
  # PUT /admin/organizations/1.json
  def update
    @admin_organization = Admin::Organization.find(params[:id])

    respond_to do |format|
      if @admin_organization.update_attributes(params[:admin_organization])
        format.html { redirect_to @admin_organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/organizations/1
  # DELETE /admin/organizations/1.json
  def destroy
    @admin_organization = Admin::Organization.find(params[:id])
    @admin_organization.destroy

    respond_to do |format|
      format.html { redirect_to admin_organizations_url }
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
