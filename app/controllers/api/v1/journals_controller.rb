class Api::V1::JournalsController < ApplicationController
  before_action :find_journal, except: [:create, :index]
  
  def index
    @journals = Journal.all
    render json: @journals 
  end

  def show
    render json: @journal
  end

  def create
    @journal = Journal.create(journal_params)
    if @journal.valid?
      render json: { journal: JournalSerializer.new(@journal)}, status: :created
    else
      render json: { error: 'failed to create journal entry' }, status: :not_acceptable
    end
  end

  def update
    byebug
    @journal.update(journal_params)
    render json: @journal
  end

  def destroy
    @journal.destroy
  end
  
  private 
  
  def find_journal
    @journal = Journal.find(params[:id])
  end

  def journal_params
    params.permit(:title, :entry, :date, :user_id)
  end
end
