class  Api::V1::UserMatchPreditionsController < ApplicationController
  before_action :authenticate_user!, except: :index

  # def index
  #   @tournaments = Tournament.all

  #   respond_to do |format|
  #     format.html { render html: @tournaments }
  #     format.json { render json: @tournaments }
  #   end
  # end


  # this is just an example. SHOuld be used for anything predictiony


  # def create
  #   @post = Post.new(post_params)

  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to @post, notice: 'Post was successfully created.' }
  #       format.json { render json: @post }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

end