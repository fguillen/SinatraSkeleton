require_relative "test_helper"

class SinatraSkeleton::AppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    SinatraSkeleton::App
  end

  def test_root
    get "/"
    assert last_response.ok?
    assert_match "SinatraSkeleton", last_response.body
  end

  def test_other_page
    get "/other_page"
    assert last_response.ok?
    assert_match "This is the other page!", last_response.body
  end

  def test_error
    assert_raises(RuntimeError) do
      get "/error"
    end
  end

  def test_visit
    count = SinatraSkeleton::Visit.count
    get "/visit"
    assert_equal(count + 1, SinatraSkeleton::Visit.count)
  end
end