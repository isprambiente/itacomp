# frozen_string_literal: true

require "test_helper"

class Itacomp::OverlayComponentTest < ViewComponent::TestCase
  test 'with only image' do
    render_inline(Itacomp::OverlayComponent.new('/image.png'))
    assert_selector 'figure.overlay-wrapper img[src="/image.png"]'   
    assert_selector 'figure.overlay-wrapper figcaption span', text: nil
  end

  test 'with text fegcaption description' do
    render_inline(Itacomp::OverlayComponent.new('/image.png', text: 'test'))
    assert_selector 'figure.overlay-wrapper figcaption span', text: 'test' 
  end

  test 'with black figcaption background' do
    render_inline(Itacomp::OverlayComponent.new('/image.png', text: 'test', black: true))
    assert_selector 'figure.overlay-wrapper figcaption.overlay-black span', text: 'test' 
  end

  test 'with icon, fullheight figcaption overlay and visually hidden text description' do
    render_inline(Itacomp::OverlayComponent.new('/image.png', text: 'test', full: true, icon: 'test'))
    assert_selector 'figure.overlay-wrapper figcaption.overlay-panel-fullheight.overlay-icon span.visually-hidden', text: 'test'
    assert_selector 'figure.overlay-wrapper figcaption.overlay-panel-fullheight.overlay-icon svg.icon use'
  end
end
