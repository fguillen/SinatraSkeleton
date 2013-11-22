require_relative "test_helper"

class ConfigTest < MiniTest::Unit::TestCase
  def test_value
    assert_equal("SinatraSkeleton (test)", SinatraSkeleton::APP_CONFIG["message"])
  end
end