class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.search(params[:searchText]).order("created_at desc").paginate(page: params[:pageNumber], per_page: params[:pageSize])

    respond_to do |f|
      f.html { render 'staffs/index' }
      f.json { 
        render json: {
          total: @staffs.total_entries,
          rows: @staffs.as_json({ index: true })
        } 
      }
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
    @staff.build_user
    @staff.build_branch
    @staff_code = "s%03d" % (Staff.last.id.to_i+1)
  end

  # GET /staffs/1/edit
  def edit
    @staff_code = "s%03d" % (Staff.find(params[:id]).id.to_i)
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff_code = "s%03d" % (Staff.last.id.to_i+1)

    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to staffs_path, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    @staff_code = "s%03d" % (Staff.find(params[:id]).id.to_i)
    
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staffs_path, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:staff_code, :position, :status, :branch_id, 
        user_attributes: [:id, :firstname, :lastname, :phone, :role, :email, :password, :password_confirmation])
    end
end
