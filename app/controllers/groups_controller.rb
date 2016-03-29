class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @membership = Membership.new(group_id: @group.id, user_id: current_user.id)
    @group.owner_id = current_user.id
    @group.save
    redirect_to groups_path
  end

  def delete
    @group = Group.find(params[:id])
    if @group.owner_id == current_user.id
      @group.destroy
      redirect_to groups_path
    else
      # error message
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
