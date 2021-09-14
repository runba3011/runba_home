class GroupUserRelationsController < ApplicationController
  def create
    @group_user_relation = GroupUserRelation.new(group_user_relation_params)
    @current_user_group_user_relation = GroupUserRelation.find_by(user_id: current_user.id , group_id: params[:group_id])
    @is_user_already_in = GroupUserRelation.find_by(user_id: params[:user_id] , group_id: params[:group_id])

    if @group_user_relation.valid?
      if @current_user_group_user_relation.authority_id > params[:group_user_relation][:authority_id].to_i && @is_user_already_in == nil
        @group_user_relation.save
      end
    end
    redirect_to edit_group_path(params[:group_id])
  end

  def update
    @operater = GroupUserRelation.find_by(user_id: current_user.id , group_id: params[:group_id])
    @group_user_relation = GroupUserRelation.find_by(user_id: params[:user_id] , group_id: params[:group_id])
    if params[:id] == "up" && @operater.authority_id > @group_user_relation.authority_id + 1
      @group_user_relation.authority_id += 1
      @group_user_relation.save
    elsif params[:id] == "down" && @operater.authority_id > @group_user_relation.authority_id && @group_user_relation.authority_id > 1
      @group_user_relation.authority_id -= 1
      @group_user_relation.save
    end
    redirect_to edit_group_path(params[:group_id])
  end

  def destroy
    @group_user_relation = GroupUserRelation.find_by(user_id: params[:id] , group_id: params[:group_id])
    @operater = GroupUserRelation.find_by(user_id: current_user.id , group_id: params[:group_id])
    if @group_user_relation == @operater || @group_user_relation.authority_id < @operater.authority_id && 3 <= @group_user_relation.authority_id
      @group_user_relation.destroy
    end
    redirect_to edit_group_path(params[:group_id])
  end

  private 


  def group_user_relation_params
    params.require(:group_user_relation).permit(:user_id , :authority_id).merge(group_id: params[:group_id])
  end

end
