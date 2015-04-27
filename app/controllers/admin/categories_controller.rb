class Admin::CategoriesController < Admin::BaseController

  before_filter :current_admin?

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    category = Category.new(name: category_params[:name])

    if category.save 
      redirect_to admin_categories_path(category)
    else
      flash[:errors] = category.errors.full_messages.join(', ')
      render :edit
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to admin_categories_path(@category)
    else
      flash[:errors] = @category.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.ideas.size == 0
      @category.destroy
    else
      flash[:errors] = "This category is already assigned to ideas, cannot delete."
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end