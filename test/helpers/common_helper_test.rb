require "test_helper"

class CommonHelperTest < ActionView::TestCase
  include Itacomp::CommonHelper
  test "ita_visually_hidden test" do
    assert_equal "<span class=\"visually-hidden\"></span>", ita_visually_hidden
    assert_equal "<span class=\"visually-hidden\">text</span>", ita_visually_hidden("text")
  end

  test "ita_icon test" do
    assert_equal "<svg class=\"icon\"><use href=\"/itacomp/sprites.svg#test\" xlink:href=\"/itacomp/sprites.svg#test\" /></svg>", ita_icon("test")
    assert_equal "<svg class=\"icon icon-bg-top\" id=\"tost\"><use href=\"/itacomp/sprites.svg#test\" xlink:href=\"/itacomp/sprites.svg#test\" /></svg>", ita_icon("test", class: "icon icon-bg-top", id: "tost")
  end
end
