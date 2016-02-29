class CreateCommentService
  attr_reader :comment

  def initialize(user, form)
    @user = user
    @form = form
  end

  def call
    return false unless @form.valid?
    save_comment
    set_parent

    true
  end

  private
  def save_comment
    @comment = @user.comments.create!(@form.comment_attributes)
  end

  def set_parent
    return if @form.parent_comment.blank?
    @comment.move_to_child_of(Comment.find(@form.parent_comment))
  end
end
