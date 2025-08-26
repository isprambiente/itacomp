# frozen_string_literal: true

require "test_helper"

class Itacomp::AlertComponentTest < ViewComponent::TestCase
  test "without params return an empty primary alert" do
    render_inline Itacomp::AlertComponent.new
    assert_selector "div.alert.alert-primary[role='alert']", text: nil
  end

  test "render text as params" do
    render_inline Itacomp::AlertComponent.new("test")
    assert_selector "div.alert.alert-primary[role='alert']", text: "test"
  end

  test "render text as block" do
    render_inline Itacomp::AlertComponent.new.with_content("test")
    assert_selector "div.alert.alert-primary[role='alert']", text: "test"
  end

  test "type option update alert style class" do
    render_inline Itacomp::AlertComponent.new(type: :warning)
    assert_selector "div.alert.alert-warning[role='alert']", text: nil
  end

  test "class params is added at alert and primary-type class" do
     render_inline Itacomp::AlertComponent.new(class: "test")
     assert_selector "div.alert.alert-primary.test[role='alert']", text: nil
  end

  test "if close option is true is added alert-dismissible fade show class and close button" do
    render_inline Itacomp::AlertComponent.new(close: true)
    assert_selector "div.alert.alert-primary.alert-dismissible.fade.show[role='alert'] button.btn-close[type='button'][data-bs-dismiss='alert'][aria-label='Close alert'] svg", text: nil
  end

  test "other named params are added to primary tag" do
     render_inline Itacomp::AlertComponent.new(id: "test")
     assert_selector "div#test.alert.alert-primary[role='alert']", text: nil
  end
end
