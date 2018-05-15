class SubsController < ApplicationController
  
  before_action :require_login
  
  def new
    @sub = Sub.new
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def destroy  
  end

  def update
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub.nil?
      flash[:errors] = ["Screw off #{current_user.username}."]
      redirect_to subs_url
      return
    end
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
end
