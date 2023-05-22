class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  # def search
  #   search_query = params[:search]
  #
  #   keywords = Keyword.where("keyword LIKE ?", "%#{search_query}%")
  #   posts = Post.joins(:keywords).where(keywords: { id: keywords })
  #
  #   @search_results = posts
  #
  #   render 'home/search'
  # end
  def search
    search_query = params[:search]

    if search_query.present?
      keywords = search_query.split(" ").map(&:downcase)
      conditions = keywords.map { |keyword| "keywords.keyword LIKE ?" }
      search_conditions = conditions.join(" OR ")
      search_arguments = keywords.map { |keyword| "%#{keyword}%" }

      @search_results = Post.joins(:keywords).where(search_conditions, *search_arguments)
    else
      @search_results = []
    end

    render 'home/search'
  end

  # def search_posts_type
  #   post_type_id = params[:post_type]
  #   puts "post_type_id: #{post_type_id}"
  #
  #
  #   if post_type_id.present?
  #     @search_results = Post.joins(:post_type).where(post_types: { id: post_type_id })
  #   else
  #     @search_results = []
  #   end
  #
  #   puts "@search_results: #{@search_results.inspect}"
  #
  #   render 'home/search_type'
  # end



  def search_posts_type
    post_type_id = params[:post_type]
    # puts "post_type_id: #{post_type_id}"

    post_type = PostType.find(post_type_id)
    @search_results = post_type.posts
    # if post_type_id.present?
    #   @search_results = Post.joins().where(post_type_id: post_type_id)
    # else
    #   @search_results = []
    # end

    puts "@search_results: #{@search_results.inspect}"

    render 'home/search_type'
  end







end
