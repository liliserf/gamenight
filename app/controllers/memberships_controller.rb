class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:group_id])
    @membership = Membership.new({group: @group})
  end

  def create
    @group = Group.find(membership_params[:group_id])
    @membership = current_user.memberships.build(group_id: @group.id)
    if @membership.save
      flash[:notice] = "You have joined this group."
      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
  end

  private

  def membership_params
    byebug
    params.permit(:membership).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
