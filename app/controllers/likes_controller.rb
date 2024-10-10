class LikesController < ApplicationController
  before_action :set_record

  def create
    current_user.likes.create!(record: @record)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to record_path(@record) }
    end
  end

  def destroy
    like = current_user.likes.find_by(record: @record)
    like&.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to record_path(@record) }
    end
  end

  private

  def set_record
    @record = Record.find(params[:record_id])
  end
end
