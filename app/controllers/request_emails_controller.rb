class RequestEmailsController < ApplicationController
  before_action :set_request_email, only: %i[ show edit update destroy ]

  # GET /request_emails or /request_emails.json
  def index
    @request_emails = RequestEmail.all
  end

  # GET /request_emails/1 or /request_emails/1.json
  def show
  end

  # GET /request_emails/new
  def new
    @request_email = RequestEmail.new
  end

  # GET /request_emails/1/edit
  def edit
  end

  # POST /request_emails or /request_emails.json
  def create
    @request_email = RequestEmail.new(request_email_params)

    respond_to do |format|
      if @request_email.save
        format.html { redirect_to @request_email, notice: "Request email was successfully created." }
        format.json { render :show, status: :created, location: @request_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_emails/1 or /request_emails/1.json
  def update
    respond_to do |format|
      if @request_email.update(request_email_params)
        format.html { redirect_to @request_email, notice: "Request email was successfully updated." }
        format.json { render :show, status: :ok, location: @request_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_emails/1 or /request_emails/1.json
  def destroy
    @request_email.destroy
    respond_to do |format|
      format.html { redirect_to request_emails_url, notice: "Request email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_email
      @request_email = RequestEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_email_params
      params.require(:request_email).permit(:name, :email)
    end
end
