class PrefsController < ApplicationController
  before_action  only: [:show, :edit, :update, :destroy]

  # GET /prefs
  # GET /prefs.json
  def index
    @prefs = Pref.all
  end

  # GET /prefs/1
  # GET /prefs/1.json
  def show
    @pref = Pref.find(params[:id])
  end

  # GET /prefs/new
  def new
    @pref = Pref.new
  end

  # GET /prefs/1/edit
  def edit
    if params[:id] != "0"
        @pref = Pref.find(params[:id])
    else
        @pref= Pref.new(name: params[:name],value: Pref.send(params[:name]))
    end

  end

  # POST /prefs
  # POST /prefs.json
  def create
    @pref = Pref.new(pref_params)
    #debugger
    respond_to do |format|
      if @pref.save
        format.html { redirect_to @pref, notice: 'Pref was successfully created.' }
        format.json { render :show, status: :created, location: @pref }
      else
        format.html { render :new }
        format.json { render json: @pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prefs/1
  # PATCH/PUT /prefs/1.json
  def update
    @pref = Pref.find(params[:id])
    respond_to do |format|
      if @pref.update(pref_params)
        format.html { redirect_to @pref, notice: 'Pref was successfully updated.' }
        format.json { render :show, status: :ok, location: @pref }
      else
        format.html { render :edit }
        format.json { render json: @pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefs/1
  # DELETE /prefs/1.json
  def destroy
    @pref.destroy
    respond_to do |format|
      format.html { redirect_to prefs_url, notice: 'Pref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pref
      @pref = Pref.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pref_params
      params.require(:pref).permit(:name, :value)
    end
end
