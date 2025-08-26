require "test_helper"

class CommonHelperTest < ActionView::TestCase
  include Itacomp::CommonHelper
  test "ita_visually_hidden test" do
    assert_equal "<span class=\"visually-hidden\"></span>", ita_visually_hidden
    assert_equal "<span class=\"visually-hidden\">text</span>", ita_visually_hidden("text")
  end

  test "ita_icon test" do
    assert_equal "<svg class=\"icon\"><use href=\"/itacomp/sprites.svg#test\" xlink:href=\"/itacomp/sprites.svg#test\" /></svg>", ita_icon("test")
    assert_equal "<svg class=\"icon icon-bg-top\" id=\"tost\"><use href=\"/itacomp/sprites.svg#test\" xlink:href=\"/itacomp/sprites.svg#test\" /></svg>", ita_icon("test", class: "icon-bg-top", id: "tost")
  end

  test "ita_spinner" do
    assert_equal '<div class="progress-spinner progress-spinner-active"><span class="visually-hidden"></span></div>', ita_spinner
    assert_equal '<div class="progress-spinner"><span class="visually-hidden"></span></div>', ita_spinner(active: false)
    assert_equal '<div class="progress-spinner progress-spinner-active"><span class="visually-hidden">Loading</span></div>', ita_spinner('Loading')
    assert_equal '<div class="progress-spinner progress-spinner-double progress-spinner-active "><span class="visually-hidden">Loading</span></div>', ita_spinner('Loading', double: true)
    assert_equal '<div class="progress-spinner progress-spinner-active size-xl"><span class="visually-hidden">Loading</span></div>', spinner('Loading', class: 'size-xl')
    assert_equal '<div id="my-spinner" class="progress-spinner progress-spinner-active size-xl" data-load="my-loader"><span class="visually-hidden">Loading</span></div>', ita_spinner('Loading', class: 'size-xl', id: 'my-spinner', data: {load: 'my-loader'})
  end
end
