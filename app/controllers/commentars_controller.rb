class CommentarsController < ApplicationController
  before_action :set_commentar, only: %i[ show edit update destroy ]

  # GET /commentars or /commentars.json
  def index
    @commentars = Commentar.all
  end

  # GET /commentars/1 or /commentars/1.json
  def show
  end

  # GET /commentars/new
  def new
    @commentar = Commentar.new
  end

  # GET /commentars/1/edit
  def edit
  end

  # POST /commentars or /commentars.json
  def create
    @post = Post.find(params[:post_id])
    @commentar = @post.commentars.build(commentar_params)
    @commentar.user = current_user # Привязка текущего пользователя к комментарию

    respond_to do |format|
      if @commentar.save
        format.html { redirect_to post_url(@post), notice: "Комментарий успешно добавлен." }
        format.json { render :show, status: :created, location: @commentar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commentar.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /commentars/1 or /commentars/1.json
  def update
    respond_to do |format|
      if @commentar.update(commentar_params)
        format.html { redirect_to commentar_url(@commentar), notice: "Commentar was successfully updated." }
        format.json { render :show, status: :ok, location: @commentar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentars/1 or /commentars/1.json
  def destroy
    @commentar.destroy

    respond_to do |format|
      format.html { redirect_to commentars_url, notice: "Commentar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentar
      @commentar = Commentar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def commentar_params
    params.require(:commentar).permit(:commentar_text)
  end
end
