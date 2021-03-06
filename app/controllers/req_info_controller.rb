class ReqInfoController < ApplicationController
  def index
    @table_id = 'all'
    @req_infos = ReqInfo.all
  end

  def req_list_by_url

    @request = Request.find_by path_url: params['path_url']

    if @request == nil
      # @req_infos = []
      # @table_id = 'nil'

      render 'req_info/request_not_found'
    else
      @req_infos = @request.req_infos
      @table_id = @request.id

      render 'req_info/index'
    end

  end
end
