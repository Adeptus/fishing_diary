class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  def has_children?
    self.children.any?
  end

  def is_child?
    !self.parent_id.blank?
  end

  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end

  def attributes_to_json
    {
      id: id,
      body: body,
      user_id: user_id,
      username: user.username,
      user_avatar_url: user.avatar.small_size.url,
      has_children: has_children?,
      is_child: is_child?
    }
  end
end
