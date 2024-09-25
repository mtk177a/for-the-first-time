class PublicRecordsController < ApplicationController
  def index
    @public_records = Record.includes(:user).order(date: :desc)
  end
end
