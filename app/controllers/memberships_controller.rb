class MembershipsController < ApplicationController
  
  def create
    group = Group.find_by_name_and_password(params[:group][:name], params[:group][:password])
    if(group.nil?)
      flash[:info] = "Den gruppe er vist ikke nem at finde"
    else
      Membership.find_by_user_id_and_group_id( current_user.id, group.id )
      flash[:success] = "Du er med"
    end
    #membership = Membership.find_or_create_by_user(_and_group( current_user, group ))

    redirect_to groups_path
  end

end
