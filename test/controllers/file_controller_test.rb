require './test/base'

class FileControllerTest < TestBase
  
  def test_it_says_hello_world
    get '/'
    f = create(:muslim_file)
    assert_equal 1, MuslimFile.first.user_id
    assert last_response.ok?
    assert_equal '123', last_response.body
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end
