require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "the truth" do
    assert true
  end
  test "should go to the index page" do
  	get :index
  	assert_response :success
  	assert_template :index
  	assert_not_nil assigns(:posts)
  end

  test "should go to the new post" do
  	get :new 
  	assert_response :success
  	assert_template :new
    assert_template layout: "layouts/application", partial: "_form"
  	assert_nil assigns(:new_post)
  end

  test "should create post" do
  	assert_difference('Post.count') do
    	post :create, post: {title: 'Test1', text: 'This is my first post.'}
  	end
  	assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:post)
  end

  test "should go to edit post" do
    get :edit, id: @post
    assert_response :success
    assert_template layout: "layouts/application", partial: "_form"
    assert_nil assigns(:edit_post) 
  end

  test "should update post" do
    patch :update, id: @post, post: {title: 'Test12', text: 'This is my first post for update action.'}
    assert_redirected_to post_path(assigns(:post))
  end

  test "should delete post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to posts_path
  end

  test "render the correct view when index action is called" do
    get :index
    assert_tag 'div', attributes: { class: 'page-header'}
  end

  test "render the correct view when new action is called" do
    get :new
    assert_select "h1",  "Create a new Posts"
  end

  test "render the show view when show action is called on a post" do
    get :show, id: @post
    assert_no_tag 'p', attributes: { strong: String }
  end

  test "the routing for the controllers" do
    assert_routing({ :method => 'get', :path => "posts"}, { :controller => 'posts', :action => 'index' })
    assert_routing({ :method => 'get', :path => "posts/new"}, { :controller => 'posts', :action => 'new' })
    assert_routing({ :method => 'post', :path => '/posts' }, { :controller => 'posts', :action => 'create' })
    assert_routing({ :method => 'get', :path => 'posts/20' }, { :controller => 'posts',  :id => '20', :action => 'show' })
    assert_routing({ :method => 'get', :path => "posts/2/edit"}, { :controller => 'posts', :id => '2', :action => 'edit' })
    assert_routing({ :method => 'patch', :path => "posts/2"}, { :controller => 'posts', :action => 'update', :id => '2' })
    assert_routing({ :method => 'delete', :path => "posts/2"}, { :controller => 'posts', :action => 'destroy', :id => '2' })
  end
    

end

	