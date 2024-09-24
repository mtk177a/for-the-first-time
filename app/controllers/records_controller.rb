class RecordsController < ApplicationController
  def index
    @records = current_user.records.order(date: :desc)
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to records_path, notice: "記録が作成されました。"
    else
      flash.now[:alert] = "記録に失敗しました。"
      render :new
    end
  end

  def edit
    @record = current_user.records.find(params[:id])
  end

  def update
    @record = current_user.records.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path, notice: "記録が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @record = current_user.records.find(params[:id])
    @record.destroy!
    redirect_to records_path, notice: "記録が削除されました。"
  end

  private

  def record_params
    params.require(:record).permit(:title, :memo, :date)
  end
end
