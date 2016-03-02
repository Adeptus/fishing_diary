class Json::CommentsController < ApplicationController

  def index
    @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
    @comments = @commentable.root_comments.order('created_at desc').page(params[:page])
    render json: @comments.map(&:attributes_to_json)
  end

  def children_comments
    @comment = Comment.find(params[:id])
    @comments = @comment.children.except(:order).order('created_at desc').page(params[:page]).per(10)
    has_more = !@comments.last_page?
    more_link = children_comments_json_comment_path(@comment, page: params[:page].to_i + 1)
    render json: {
      has_more: has_more,
      more_link: more_link,
      comments: @comments.map(&:attributes_to_json)
    }
  end
end
