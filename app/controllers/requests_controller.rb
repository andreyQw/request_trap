class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def check_req

    @req = request

    @request = Request.find_or_create_by(path_url: params['path_url'].to_s)

    header_keys = request.headers.env.keys.select do |header_name|
      header_name.match("^HTTP|^REQUEST|^SERVER|^QUERY|PATH")
    end
    header_list = {}
    header_keys.each {|key| header_list[key] = request.headers[key]}

    @info = @request.req_infos.create(
        :remote_ip => @req.remote_ip,
        :req_method => @req.request_method,
        :scheme => params['scheme'],
        :query_string => @req.query_string,
        :query_params => params,
        :cookies => @req.cookies,
        :headers => header_list.to_s
    )

    Pusher.trigger('request-channel', 'request-event', {
        path_url: @request.path_url,
        req_id: @request.id
    })

    Pusher.trigger('req_info-channel', 'req_info-event', {
        path_url: @request.path_url,
        remote_ip: @info.remote_ip,
        req_method: @info.req_method,
        scheme: @info.scheme,
        query_string: @info.query_string,
        query_params: @info.query_params,
        cookies: @info.cookies,
        headers: @info.headers
    })

    @id_channel = @request.id.to_s + '-channel'
    @id_event = @request.id.to_s + '-event'

    Pusher.trigger(@id_channel, @id_event, {
        path_url: @request.path_url,
        remote_ip: @info.remote_ip,
        req_method: @info.req_method,
        scheme: @info.scheme,
        query_string: @info.query_string,
        query_params: @info.query_params,
        cookies: @info.cookies,
        headers: @info.headers
    })

    respond_to do |format|

      format.html { redirect_to requests_url }
      format.js
      format.json {
        render :'requests/index', status: :created, location: @request
      }

    end

  end

  # GET /requests
  # GET /requests.json
  def index
    @req = request
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
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
