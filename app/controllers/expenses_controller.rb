class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]

  def index
    @expenses = current_user.expenses
  end

  def show
  end

  def new
    @expense = Expense.new
    @categories = current_user.categories
  end

  def edit
   @expense = Expense.new
   @categories = current_user.categories
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @categories = current_user.categories

    respond_to do |format|
      if @expense.save
        category =  expense_params[:category_ids][1]
        format.html { redirect_to category_path(category), notice: "Expense was successfully created." }
      
      else
        format.html { render :new, status: :unprocessable_entity }
       
      end
    end
  end


  def update
     @expense = Expense.new(expense_params)
     @expense.user = current_user
     @categories = current_user.categories

    respond_to do |format|
     category =  expense_params[:category_ids][1]
      if @expense.update(expense_params)
        format.html { redirect_to category_path(category), notice: "Expense was successfully updated." }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy
    category = Category.find(params[:category_id])

    respond_to do |format|
      format.html { redirect_to  category_path(category), notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :amount, { category_ids: [] })
    end
end
