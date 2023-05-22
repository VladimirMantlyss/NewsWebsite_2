class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  # POST /posts or /posts.json
  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    # @post.authors << Author.find_by(user_id: post_params[:author_id])
    # @post.authors << Author.find_by(user_id: 2)
    @post.author_id = current_user.author.user_id
    @post.authors << Author.find_by(user_id: current_user.author.user_id)

    # Получите выбранные ключевые слова из формы
    keyword_ids = params[:post][:keyword_ids]

    # Найдите соответствующие записи Keyword
    keywords = Keyword.where(id: keyword_ids)

    # Добавьте найденные ключевые слова к посту
    @post.keywords << keywords

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)

        # # Удаляем существующую связь автора и поста
        # @post.authors.destroy_all
        # # Создаем новую связь с выбранным автором
        # @post.authors << Author.find(params[:post][:author_id])

        # Удаляем существующие связи ключевых слов и поста
        @post.keywords.clear
        # Добавляем новые связи с выбранными ключевыми словами
        keywords_ids = params[:post][:keyword_ids]
        keywords_ids.each do |keyword_id|
          keyword = Keyword.find(keyword_id)
          @post.keywords << keyword if keyword
        end

        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end




  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Пост успішно видален." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:post_type_id, :title, :post_text, :author_id)
  end
end
