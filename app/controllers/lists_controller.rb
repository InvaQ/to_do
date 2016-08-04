class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end
  def edit

  end

  def update

  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end








  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :descriotion)
  end
end
