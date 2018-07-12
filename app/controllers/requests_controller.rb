class RequestsController < ApplicationController
  before_action :set_request, only: [:destroy]

  def check_req

    @req = request

    @request = Request.find_or_create_by(path_url: params['path_url'])

    headers = request.headers.env.select{|k, _| k =~ /^HTTP|^REQUEST|^SERVER|^QUERY|PATH/}

    @info = @request.req_infos.create(
        remote_ip: @req.remote_ip,
        req_method: @req.method,
        scheme: params['scheme'],
        query_string: @req.query_string,
        query_params: params,
        cookies: @req.cookies,
        headers: headers.to_s
    )

    respond_to do |format|
      format.html { redirect_to requests_url}
      format.js
    end
  end

  def index
    @req = request
    @requests = Request.all
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.permit(:path_url)
    end
end
