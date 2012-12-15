class ServicesController < ApplicationController
  before_filter :protect_admin, except: :index

  def index
    @services = Service.all(order: "position")
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])
    redirect_to @service
  end

  def create
    @service = Service.new(params[:service])
    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_url
  end

  def sort
    params[:services].each_with_index do |service, index|
      Service.update_all(['position=?', index+1], ['id=?', service[1]["id"]])
    end
    render nothing: true
  end

end
