class WorkbooksController < ApplicationController
  def index
    @workbooks = if params[:name]
                 Workbook.where_ilike name: params[:name]
               else
                 Workbook.all
               end
  end
end
