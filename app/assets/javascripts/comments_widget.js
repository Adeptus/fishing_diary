CommentsWidget = function() {
  var commentable = app.vars.commentable;
  var currentUser = app.vars.currentUser;
  var currentPage = 1;
  var perPage = 25;
  var totalPages = Math.ceil(commentable.commentsCount / perPage);

  function loadSubcomments(link) {
    var link = link;

    $.ajax({
      url: link.attr('href'),
      type: 'get',
      success: function(response) {
        link.parent().find('.children-comments').append(generateCommentsHtml(response.comments));
        if (response.has_more) {
          link.attr('href', response.more_link);
          link.removeClass('new');
        } else {
          link.remove();
        }
      }
   })
  }


  function loadPage() {
    $('#comments-list').append('<img class="spinner"/>');
    var url = '/json/comments?commentable_id=' + commentable.commentableId + '&commentable_type=' + commentable.commentableClass + '&page=' + currentPage;

    $.ajax({
      url: url,
      dataType: 'json',
      success: function(response) {
        successHandler(response);
      }
    });
  }

  function generateCommentsHtml(comments) {
    var html = '';

    for (i = 0; i < comments.length; i++) {
      var comment = comments[i];
      if (currentUser !== undefined) {
        comment['currentUser'] = currentUser !== undefined
        comment['can_remove'] = (comment['user_id'] == currentUser.id && !comment['has_children'])
      }
      html += HandlebarsTemplates['comments/comment'](comment);
    }
    return html;
  }

  function removeComment(link) {
    var link = link;

    $.ajax({
      url: link.attr('href'),
      type: 'delete',
      success: function(response) {
        link.closest('li.comment').remove();
      }
    })
  }

  function submitComment(form) {
    var form = form;

    $.ajax({
      url: form.attr('action'),
      type: 'post',
      data: form.serialize(),
      success: function(response) {
        form.find('textarea').val('')
        form.find('textarea').parent().removeClass('has-error');
        form.find('.help-block').remove();
        if (currentUser !== undefined) {
          response['currentUser'] = currentUser !== undefined
          response['can_remove'] = (response['user_id'] == currentUser.id && !response['has_children'])
        }
        if(form.find('.comment_parent_id').val() == '') {
          $('#comments-list').append(HandlebarsTemplates['comments/comment'](response));
        } else {
          form.parent().next().append(HandlebarsTemplates['comments/comment'](response));
          form.remove();
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        form.find('.help-block').remove();
        var errorDiv = form.find('textarea').parent();
        var errorMessage = jQuery.parseJSON(jqXHR.responseText).errors;
        errorDiv.addClass('has-error');
        errorDiv.append("<span class='help-block'>" + errorMessage + "</span>");
      }
    })
  }

  function formData() {
    var data = currentUser;
    data['csrfToken'] = $('meta[name="csrf-token"]').attr('content');
    data['commentableId'] = commentable.commentableId;
    data['commentableClass'] = commentable.commentableClass;
    return data;
  }

  function addCommentForm(link) {
    var data = formData();
    data['parentId'] = link.attr('parent')
    var element = link.closest('.comment').find('.children-comment-form');
    element.html(HandlebarsTemplates['comments/new'](data));
    $('html, body').animate({
      scrollTop: element.offset().top
    }, 2000);
  }

  function successHandler(comments) {
    $('#comments-list .spinner').remove();
    $('#comments-list').append(generateCommentsHtml(comments));
    if (currentPage === totalPages) {
      $('#comments-container .more').hide();
    }
    $('.more-children-comments.new').each( function() { loadSubcomments($(this)) })
  }

  this.run = function() {
    $('#comments-container').on('click', '.remove-comment', function(e) {
      e.preventDefault()
      removeComment($(this))
    })

    $('#comments-container').on('click', '.more', function(e) {
      e.preventDefault()
      currentPage++;
      loadPage();
    });

    $('#comments-container').on('click', '.more-children-comments', function(e) {
      e.preventDefault()
      loadSubcomments($(this));
    });

    $('#comments-container').on('submit', '.new_comment', function(e) {
      e.preventDefault();
      submitComment($(this));
    });

    $('#comments-container').on('click', '.add-children-comment-form', function(e) {
      e.preventDefault()
      addCommentForm($(this));
    });

    if (totalPages > 0) {
      loadPage();
    } else {
      $('#comments-container .more').hide();
    }

    if (currentUser !== undefined) {
      var data = formData();
      $('#comments-container .comment-form').html(HandlebarsTemplates['comments/new'](data));
    }
  };

  return this;
}
