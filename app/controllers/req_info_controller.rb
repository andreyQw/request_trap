class ReqInfoController < ApplicationController
  def index
    @table_id = 'all'
    @req_infos = ReqInfo.all
  end

  def req_list_by_url
    @req = request

    @request = Request.find_by path_url: params['path_url']

    if @request == nil
      # @req_infos = []
      # @table_id = 'nil'

      render 'req_info/request_not_found'
    else
      @req_infos = @request.req_infos
      @table_id = @request.id


      respond_to do |format|
        format.json { render :show, status: :created, location: 'req_info#index' }
        format.html { render 'req_info/index' }
      end
    end

  end
end
