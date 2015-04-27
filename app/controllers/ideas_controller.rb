class IdeasController < ApplicationController

  before_filter :current_user

  def show
    idea = Idea.find_by(id: params[:id])
    
    if idea && user_owns_idea?(idea)
      @idea = idea
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    idea = Idea.find_by(id: params[:id])

    if idea && user_owns_idea?(idea)
      @idea = idea
    else
      flash[:errors] = idea.errors.full_messages.join(', ')
      render :edit
    end
  end

  def update
    idea = current_user.find_by(id: idea_params[:id])

    if idea && user_owns_idea?(idea)
      @idea = idea.update(idea_params)
      redirect_to idea_path(@idea) 
    else
      flash[:errors] 
      redirect_to user_path(current_user)
    end
  end 

  def create
    idea = Idea.new(title: idea_params[:title], 
                    description: idea_params[:description], 
                    user_id: current_user.id,
                    category_id: idea_params[:category_id])

    if current_user && idea.save
      redirect_to idea_path(idea)
    else
      flash[:errors] = idea.errors.full_messages.join(', ')
      redirect_to new_idea_path
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy if user_owns_idea?(idea)
    redirect_to user_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:id, :title, :description, :category_id)
  end

end