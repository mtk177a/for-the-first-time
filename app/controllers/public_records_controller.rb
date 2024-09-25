class PublicRecordsController < ApplicationController
  skip_before_action :require_login, only: [ :index ]

  def index
    @public_records = Record.includes(:user).order(date: :desc)
  end
end
