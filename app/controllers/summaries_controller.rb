class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @summaries = Summary.all
  end

  def show
  end

  
  def new
    @summary = Summary.new
  end

  
  def edit
  
  end

  
  def create
    @summary = Summary.new(summary_params)
      if @summary.save
        @summary.post = @post
        flash[:notice] = "Summary was successfully created."
        redirect_to summary_path(@summary)
      else
        render :new
      end
  end

  
  def update
    if @summary.update(summary_params)
      flash[:notice] = 'Summary was successfully updated.'
      redirect_to action: :show
    else
      render :edit
    end
  end

  
  def destroy
    @summary.destroy
    flash[:notice] = 'Summary was successfully destroyed.'
    redirect_to @summary
  end

  private
    
    def set_summary
      @post = Post.find(params[:id])
      @summary = Summary.find(params[:id])
      @post.summary = @summary
    end

    def summary_params
      params.require(:summary).permit(:description)
    end
  end


