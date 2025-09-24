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
    assert_equal '<div class="progress-spinner progress-spinner-active"><span class="visually-hidden">Loading</span></div>', ita_spinner("Loading")
    assert_equal '<div class="progress-spinner progress-spinner-double progress-spinner-active"><span class="visually-hidden">Loading</span></div>', ita_spinner("Loading", double: true)
    assert_equal '<div class="progress-spinner size-xl progress-spinner-active"><span class="visually-hidden">Loading</span></div>', ita_spinner("Loading", class: "size-xl")
    assert_equal '<div class="progress-spinner size-xl progress-spinner-active" id="my-spinner" data-load="my-loader"><span class="visually-hidden">Loading</span></div>', ita_spinner("Loading", class: "size-xl", id: "my-spinner", data: { load: "my-loader" })
  end

  test "ita_donut" do
    assert_equal "<div class=\"progress-donut-wrapper\"><div class=\"progress-donut\" data-bs-progress-donut=\"true\" data-bs-value=\"0.0\"></div><span class=\"visually-hidden\">0%</span></div>", ita_donut
    assert_equal "<div class=\"progress-donut-wrapper\"><div class=\"progress-donut\" data-bs-progress-donut=\"true\" data-bs-value=\"0.5\"></div><span class=\"visually-hidden\">50%</span></div>", ita_donut(50)
    assert_equal "<div class=\"progress-donut-wrapper\"><div id=\"test\" class=\"progress-donut\" data-bs-progress-donut=\"true\" data-bs-value=\"0.5\"></div><span class=\"visually-hidden\">50%</span></div>", ita_donut(50, id: "test")
  end

  test "ita_progress" do
    assert_equal '<div class="progress progress-indeterminate"><div class="progress-bar" role="progressbar"></div></div>', ita_progress
    assert_equal '<div class="progress"><div class="progress-bar" role="progressbar" style="width: 50%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="50"></div></div>', ita_progress(50)
    assert_equal '<div class="progress progress-color"><div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="50"></div></div>', ita_progress(50, type: "primary")
  end

  test "ita_badge" do
    assert_equal '<span class="badge">1</span>', ita_badge(1)
    assert_equal '<span class="badge test" id="test">1</span>', ita_badge(1, class: 'test', id: 'test')
    assert_equal '<span class="badge">1</span><span class="visually-hidden">test</span>', ita_badge(1, 'test')
  end

  test "ita_size" do
    assert_equal "size-md", ita_size
    assert_equal "size-xs", ita_size(:xs)
    assert_equal "size-xs", ita_size("xs")
    assert_equal "size-md", ita_size(:other)
  end

  test "ita_bg" do
    assert_equal "bg-primary", ita_bg
    assert_equal "bg-secondary", ita_bg(:secondary)
    assert_equal "bg-secondary", ita_bg("secondary")
    assert_equal "bg-primary", ita_bg(:other)
  end

  test "ita_text" do
    assert_equal "text-primary", ita_text
    assert_equal "text-secondary", ita_text(:secondary)
    assert_equal "text-secondary", ita_text("secondary")
    assert_equal "text-primary", ita_text(:other)
  end
end
