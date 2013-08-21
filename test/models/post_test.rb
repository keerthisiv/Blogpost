require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" dox
  #   assert true
  # end

  	test "should not create a Post without a title" do
  		post = Post.create
  		assert post.errors[:title].include?("can't be blank"), "Created a Post without a title."
  	end

	test "should not create a Post with title less than 5 characters in length" do
		post = Post.create(title: "hi")
		assert post.errors[:title].include?("is too short (minimum is 5 characters)"), "Created a Post with a title less than 5 characters"
	end

	test "should not create a Post with title containing spaces" do
		post = Post.create(title: "hi there")
		assert post.errors[:title].include?("is invalid"), "Created a Post with a title containing spaces between characters"
	end

	test "should not create a Post with title more than 10 characters in length" do
		post = Post.create(title: "This_title_is_to_big_to_be_a_title")
		assert post.errors[:title].include?("is too long (maximum is 10 characters)"), "Created a Post with a title more than 10 characters"
	end

	test "should not create a Post with title not formatted correctly" do
		post = Post.create(title: "A-user_123@*")
		assert post.errors[:title].include?("is invalid"), "Created a Post with a title not formatted properly"
	end

	test "should not create a Post without content" do
  		post = Post.create
  		assert post.errors[:text].include?("can't be blank"), "Created a Post without content"
  	end

	test "should not create a Post with content less than 10 characters in length" do
  		post = Post.create(text: "Test")
  		assert post.errors[:text].include?("is too short (minimum is 10 characters)")
  	end
  	
  	test "Title of the post should have something" do
  		post = Post.new(title: "Starbucks")
  		assert_not_nil post.title, "Returns nil for Title"
  	end

  	test "Title of the Post should match the regular experssion" do
  		post = Post.new(title: "A-user_123")
  		assert_match( /\A[a-zA-Z0-9\-\_]+\Z/, post.title, "Title does not match the regular expression for the title" )
  	end

  	test "Content of the post should be equal to the text field" do
  		post = Post.new(text: "It's a cold morning today")
  		assert_equal "It's a cold morning today", post.text, "Content of the post is not equal to the text entered to the post"
  	end

  	test "should contain the content of the post" do
  		p = posts(:one)
  		assert_equal "This is a test post", p.text, "Expected content is not equal to the actual content of the post"
  	end

  	test "should have title" do
  		p = posts(:two)
  		assert_not_nil p.title, "Return nil for title"
  	end

    test "should not create posts with similar title" do
      post1 = Post.create(title: "Test1", text: "this is a test")
      post2 = Post.create(title: "Test1", text: "this is a test")
      assert post2.errors[:title].include?("has already been taken"), "Created a post with existing title"
    end

  		
end


