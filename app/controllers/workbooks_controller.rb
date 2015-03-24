class WorkbooksController < ApplicationController

  def index
    @workbooks = if params[:name]
                   Workbook.where_ilike name: params[:name]
                 else
                   Workbook.all
                 end
  end

  def show
    @workbook = Workbook.find_by(hex_id: params[:id]) ||
                Workbook.find(params[:id])
  end

end
