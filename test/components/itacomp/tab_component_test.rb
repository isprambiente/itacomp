# frozen_string_literal: true

require "test_helper"

class Itacomp::TabComponentTest < ViewComponent::TestCase
  test "empty tabs" do
    render_inline Itacomp::TabComponent.new()
    assert_selector "ul.nav.nav-tabs[role='tablist']", text: nil
  end

  test "can add options to ul selector" do
    render_inline Itacomp::TabComponent.new(id: "uno", class: "due", data: { value: "tre" })
    assert_selector "ul#uno.nav.nav-tabs.due[role='tablist'][data-value='tre']", text: nil
  end

  test "can add content as array" do
    render_inline Itacomp::TabComponent.new([ [ "uno", "/due", { active: true } ], [ "tre", "/quattro" ] ])
    assert_selector "ul.nav.nav-tabs[role='tablist'] li.nav-item a.nav-link[active='true'][href='/due']", text: "uno"
    assert_selector "ul.nav.nav-tabs[role='tablist'] li.nav-item a.nav-link[href='/quattro']", text: "tre"
  end
end
