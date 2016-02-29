class CreateCommentForm
  include ActiveModel::Model

  attr_accessor(
    :commentable_id,
    :commentable_type,
    :body,
    :parent_comment
  )

  attr_reader :parent_comment

  validates :commentable_id, :commentable_type, presence: true
  validates :body, presence: true
  validate :time_of_last_comment

  def initialize(user, attributes = {})
    @parent_comment = attributes[:parent_comment]
    @user = user
    super(attributes)
  end

  def comment_attributes
    {
      body: body,
      commentable_id: commentable_id,
      commentable_type: commentable_type
    }
  end

  def time_of_last_comment
    return unless @user.comments.any?
    last_comment_time = @user.comments.last.created_at
    if ( last_comment_time + 30.seconds ) > DateTime.now
      errors[:body] << _("can't add comment less than 30 seconds after last one")
    end
  end
end
