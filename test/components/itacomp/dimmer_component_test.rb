# frozen_string_literal: true

require "test_helper"

class Itacomp::DimmerComponentTest < ViewComponent::TestCase
  test "empty" do
    render_inline Itacomp::DimmerComponent.new()
    assert_selector "div.dimmable div.dimmer.show div.dimmer-inner", text: nil
  end

  test "with dimmable element option" do
    render_inline Itacomp::DimmerComponent.new(id: "idtest", class: "classtest", data: { test: "test" })
    assert_selector "div#idtest.dimmable.classtest[data-test='test'] div.dimmer div.dimmer-inner", text: nil
  end

  test "with dimmer element option" do
    render_inline Itacomp::DimmerComponent.new(dimmer: { id: "idtest", class: "classtest", data: { test: "test" } })
    assert_selector "div.dimmable div#idtest.dimmer.classtest[data-test='test'] div.dimmer-inner", text: nil
  end

  test "hidden dimmer" do
    render_inline Itacomp::DimmerComponent.new(show: false)
    assert_selector "div.dimmable div.dimmer[aria-hidden='true'] div.dimmer-inner", text: nil
  end

  test "with options for icon and text" do
    render_inline Itacomp::DimmerComponent.new(icon: "test", text: "text")
    assert_selector "div.dimmable div.dimmer div.dimmer-inner p", text: "text"
    assert_selector "div.dimmable div.dimmer div.dimmer-inner div.dimmer-icon svg.icon.icon-xl use", text: nil
  end

  test "with content" do
    render_inline Itacomp::DimmerComponent.new() do
      "dimmable_text"
    end
    assert_selector "div.dimmable", text: "dimmable_text"
  end

  test "with inner_content" do
    render_inline Itacomp::DimmerComponent.new() do |component|
      component.with_inner_content { "dimmer_text" }
    end
    assert_selector "div.dimmable div.dimmer div.dimmer-inner", text: "dimmer_text"
  end
end
