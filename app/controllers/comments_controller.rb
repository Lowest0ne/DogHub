class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    # Sam, I was getting 'no method' for Comment.build
    @comment = Comment.new
  end

  def create
    @comment = Comment.new( comment_params )

    if @comment.save
      redirect_to '/comments', notice: "Thanks for the comment"
    else
      render action: 'new'
    end
  end

  def destroy
    comment = Comment.find( params[:id] )
    comment.destroy if comment
    redirect_to '/comments'
  end

  private
  def comment_params
    params.require( :comment ).permit( :email, :subject, :description, :first_name, :last_name )
  end

end
