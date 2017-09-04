require './test/base'

class TaskControllerTest < TestBase
  
  test 'a b' do
    get '/'
    assert_nil MuslimFile.first
    assert last_response.ok?
    assert_equal '234', last_response.body
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end
