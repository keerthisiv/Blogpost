
require 'test_helper'

class PostTest < ActionDispatch::IntegrationTest
	fixtures :posts

	test "test posts and browse" do
	    https!
	    get "/"
	    assert_response :success
	    assert_template :index

	    request_via_redirect('get', "/posts")
	    assert_response :success
	    assert_not_nil assigns(:posts)

	end

	test "creating a new post" do
		https!
		get "/posts/new"
		assert_response :success
		assert_template layout: "layouts/application", partial: "_form"
		assert_nil assigns(:new_path)

		post_via_redirect('get', "/posts/new", title: "Testing1", text: "This is a new one for testing" )
		assert_equal '/post', path
	end 
end