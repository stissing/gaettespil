class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def create
    group = Group.new(params[:group])
    if group.save
      flash[:info] = "Gruppen er oprettet. Lok nogle folk med i den."
      current_user.groups << group

    else
      flash[:error] = "Gruppen kunne sgu'tte oprettes. Pokkers. Har nogle andre brugt det gode gruppenavn?"
    end
      redirect_to groups_path
  end

end
