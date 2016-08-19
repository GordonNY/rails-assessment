$(function () {
    $('form').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize();
      var url = $(this).attr('action');
      
      $.post(url, values)
      	.done(function(comment) {
          console.log(comment)

          function Comment(content, createdAt, userEmail) {
            this.content = content;
            this.userEmail = userEmail;
            this.createdAt = new Date(createdAt).toGMTString().replace('GMT', 'UTC');
          }

          Comment.prototype.commentFrom = function(){
            return this.userEmail + ' | ' + this.createdAt;
          }

          //user.email + ' | ' + comment.created_at
      		var commentContent = new Comment(comment.content, comment.created_at, comment.user.email)

          $('div#comments').append( 
            $('<div>').attr('class', 'comment').attr('id', comment.id).append(
              $('<p>').text(comment.content)
           )); 
          $('div#' + comment.id).append(
              $('<p>').attr('id', 'comment_from').text(commentContent.commentFrom())
           ); 
          $('div#comments').append( 
            $('<hr>')
           ); 
      	})
    });
  });