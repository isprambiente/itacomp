# frozen_string_literal: true

require "test_helper"

class Itacomp::TurboFrameComponentTest < ViewComponent::TestCase
  test "witout argument return an empty turbo-frame tag with an empty id" do
    render_inline Itacomp::TurboFrameComponent.new
    assert_selector "turbo-frame", text: nil
  end

  test "content go in turbo-frame tag" do
    render_inline Itacomp::TurboFrameComponent.new().with_content("test")
    assert_selector "turbo-frame", text: "test"
  end

  test "any keys is added to turbo-frame tag" do
    render_inline Itacomp::TurboFrameComponent.new(id: "test", class: "tost")
    assert_selector "turbo-frame#test.tost", text: nil
  end

  test "if is present href key and content is empty is added the loader div" do
    render_inline Itacomp::TurboFrameComponent.new(href: "http://test.it")
    assert_selector "turbo-frame div.progress-spinner.progress-spinner-active span.visually-hidden", text: "Loading..."
  end
end
