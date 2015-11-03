class ActionsController < InheritedResources::Base

  before_action :authenticate_user!

  def participate
    if current_user.actions.create(status: :pending, task_id: params[:task_id])
      render json: { sucess: true }
    else
      render json: { sucess: false }
    end
  end

  def confirmate
    @action = current_user.actions.find(params[:action_id])
    @action.status = :waiting_accepted

    if @action.save
      render json: { sucess: true }
    else
      render json: { sucess: false }
    end
  end

  def finalize
    @action = Action.find(params[:action_id])
    @action.status = :accept

    if @action.save
      render json: { sucess: true }
    else
      render json: { sucess: false }
    end
  end

  private

  def actual_menu_context
    :actions
  end

end
