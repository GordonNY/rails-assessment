module PostsHelper
	def edit_action(user_id, post)
		if user_id && user_id == post.user_id
    link_to 'Edit', edit_post_path(post), class: "btn btn-primary btn-xs"
    
    end
	end

	def delete_action(user_id, post)
		if user_id && user_id == post.user_id
    
    link_to 'Delete', post, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger btn-xs"
    end
	end
end
