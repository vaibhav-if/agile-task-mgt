class AttachmentsController < ApplicationController
  before_action :get_task
  before_action :set_attachment, only: %i[ show edit update destroy ]

  # GET /attachments or /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1 or /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = @task.attachment.build
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments or /attachments.json
  def create
    @attachment = @task.attachment.build(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to task_attachments_path(@task), notice: "Attachment was successfully created." }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1 or /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to task_attachments_path(@task), notice: "Attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1 or /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to task_sub_tasks_path(@task), notice: "Attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_task
      @task = Task.find(params[:task_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = @task.attachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_params
      params.require(:attachment).permit(:task_id, uploads: [])
      # params.fetch(:attachment, {})
    end
end
