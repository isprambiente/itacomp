# frozen_string_literal: true

require "test_helper"

class Itacomp::AvatarComponentTest < ViewComponent::TestCase
  test "without params return an empty avatar div" do
    render_inline Itacomp::AvatarComponent.new
    assert_selector "div.avatar", text: nil
  end

  test "avatar with content" do
    render_inline Itacomp::AvatarComponent.new.with_content("test")
    assert_selector "div.avatar", text: "test"
  end

  test "set size" do
    render_inline Itacomp::AvatarComponent.new(size: "md")
    assert_selector "div.avatar.size-md", text: nil
  end

  test "set bg" do
    render_inline Itacomp::AvatarComponent.new(bg: "md")
    assert_selector "div.avatar.avatar-primary", text: nil
  end

  test "add id" do
    render_inline Itacomp::AvatarComponent.new(id: "test")
    assert_selector "div#test.avatar", text: nil
  end

  test "add data" do
    render_inline Itacomp::AvatarComponent.new(data: { test: "tost" })
    assert_selector "div.avatar[data-test='tost']", text: nil
  end
end
