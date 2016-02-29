class CommentsController < ApplicationController
  before_action :load_comment, only: [:destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def create
    @form = CreateCommentForm.new(current_user, comment_params)
    service = CreateCommentService.new(current_user, @form)
    if service.call
      render json: (service.comment.attributes_to_json)
    else
      errors = @form.errors[:body].any? ? @form.errors[:body][0] : _('Can\'t add comment.')
      render json: { errors: errors }, status: 400
    end
  end

  def destroy
    if @comment.destroy
      render json: {success: _('Comment was successfully deleted.')}
    else
      render json: {errors: [_('Can\'t delate comment.')]}
    end
  end

  private

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def not_found
    redirect_to :back, alert: _('Comment not exist')
  end

  def comment_params
    params.require(:comment).permit(
      :body,
      :commentable_id,
      :commentable_type,
      :parent_comment,
    )
  end
end
