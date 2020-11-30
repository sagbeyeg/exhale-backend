class JournalsController < ApplicationController
  def create
    @journal = Journal.create(journal_params)
    if @journal.valid?
      render json: { journal: JournalSerializer.new(@journal)}, status: :created
    else
      render json: { error: 'failed to create journal entry' }, status: :not_acceptable
    end
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :entry, :date, :user_id)
  end
end
