
$(function () {
	
    $.get("/categories", function(data) {
      data.forEach(function(category) {
      	$('ul#category').append( $('<li>').text(category.name).append(
      			$('<ul>').attr('id', category.name)
      		)); 
      	category.posts.forEach(function(post) {
      		var url = '/posts/' + post.id;

      		$('ul#' + category.name).append( 
						$('<li>').append(
			        $('<a>').attr('href', url).text(post.description)
			     )); 
      	});
      })
    });

});