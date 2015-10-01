class GroupsController < ApplicationController
  def index
    @group = Group.new
    @group.users.build
    @activities = PublicActivity::Activity.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params_2
    if @group.save
      redirect_to root_path
    else
      render "index"
    end
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find params[:id]
    if @group.update_attributes group_params_2
      redirect_to root_path
    else
      render "edit"
    end
  end

  private
  #for nested_form
  def group_params
    params.require(:group).permit :name, users_attributes: [:id, :name, :_destroy]
  end

  def group_params_2
    params.require(:group).permit :name, user_ids: []
  end
end
