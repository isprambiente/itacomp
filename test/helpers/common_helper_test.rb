require "test_helper"

class CommonHelperTest < ActionView::TestCase
  include Itacomp::CommonHelper
  test "ita_visually_hidden test" do
    assert_equal "<span class=\"visually-hidden\"></span>", ita_visually_hidden
    assert_equal "<span class=\"visually-hidden\">text</span>", ita_visually_hidden("text")
  end
end
