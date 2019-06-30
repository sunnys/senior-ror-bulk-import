class BulkEmployeeUploadsController < ApplicationController
  before_action :set_bulk_employee_upload, only: [:show, :edit, :update, :destroy, :employees_index, :errors_index, :generate_csv]

  # GET /bulk_employee_uploads
  # GET /bulk_employee_uploads.json
  def index
    @bulk_employee_uploads = BulkEmployeeUpload.all
  end

  # GET /bulk_employee_uploads/1
  # GET /bulk_employee_uploads/1.json
  def show
    @employee_count = Employee.where(bulk_employee_upload_id: @bulk_employee_upload.id).size
    @err_count = EmpTempStorageError.where(bulk_employee_upload_id: @bulk_employee_upload.id).size
    @total = @employee_count + @err_count
  end

  # GET /bulk_employee_uploads/new
  def new
    @bulk_employee_upload = BulkEmployeeUpload.new
    @companies = Company.all
  end

  # GET /bulk_employee_uploads/1/edit
  def edit
    @companies = Company.all
  end

  # GET /bulk_employee_uploads/1/employees
  def employees_index
    @employees = Employee.where(bulk_employee_upload_id: @bulk_employee_upload.id)
  end

  # GET /bulk_employee_uploads/1/errors
  def errors_index
    @errors = EmpTempStorageError.where(bulk_employee_upload_id: @bulk_employee_upload.id)
    @employees = []
    @errors.each_with_index do |err, index|
      fr = JSON.parse(err.data).with_indifferent_access
      fr[:errors] = JSON.parse(@errors[index].upload_errors)[0]
      @employees << fr
    end
  end

  def generate_csv
    # respond_to do |format|
      # format.html
      send_data @bulk_employee_upload.to_csv, filename: "upload-#{Date.today}.csv"
    # end
  end
  

  # POST /bulk_employee_uploads
  # POST /bulk_employee_uploads.json
  def create
    @bulk_employee_upload = BulkEmployeeUpload.new(bulk_employee_upload_params)
    # render json: @bulk_employee_upload
    # return
    respond_to do |format|
      if @bulk_employee_upload.save
        format.html { redirect_to @bulk_employee_upload, notice: 'Bulk employee file was successfully created.' }
        format.json { render :show, status: :created, location: @bulk_employee_upload }
      else
        format.html { render :new }
        format.json { render json: @bulk_employee_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulk_employee_uploads/1
  # PATCH/PUT /bulk_employee_uploads/1.json
  def update
    respond_to do |format|
      if @bulk_employee_upload.update(bulk_employee_upload_params)
        format.html { redirect_to @bulk_employee_upload, notice: 'Bulk employee file was successfully updated.' }
        format.json { render :show, status: :ok, location: @bulk_employee_upload }
      else
        format.html { render :edit }
        format.json { render json: @bulk_employee_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulk_employee_uploads/1
  # DELETE /bulk_employee_uploads/1.json
  def destroy
    @bulk_employee_upload.destroy
    respond_to do |format|
      format.html { redirect_to bulk_employee_uploads_url, notice: 'Bulk employee file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulk_employee_upload
      @bulk_employee_upload = BulkEmployeeUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulk_employee_upload_params
      params.require(:bulk_employee_upload).permit(:company_id, :file)
    end
end
