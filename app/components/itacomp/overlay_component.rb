# frozen_string_literal: true

module Itacomp
  # make a strcture for [overlay] component](https://italia.github.io/bootstrap-italia/docs/componenti/ove/)
  # ==== Example
  # With only required img
  #   <%= render Itacomp::OverlayComponent.new('test.jpg') %>
  #   <figure class="overlay-wrapper"><img src="/images/test.jpg" /><figcaption class="overlay-panel"><span></span></figcaption></figure>
  # With text
  #   <%= render Itacomp::OverlayComponent.new('test.jpg', text: 'My text') %>
  #   <figure class="overlay-wrapper"><img src="/images/test.jpg" /><figcaption class="overlay-panel"><span>My text</span></figcaption></figure>
  # With black background 
  #   <%= render Itacomp::OverlayComponent.new('test.jpg', text: 'My text', black: true) %>
  #   <figure class="overlay-wrapper"><img src="/images/test.jpg" /><figcaption class="overlay-panel overlay-black"><span>My text</span></figcaption></figure>
  # With full height 
  #   <%= render Itacomp::OverlayComponent.new('test.jpg', text: 'My text', full: true) %>
  #   <figure class="overlay-wrapper"><img src="/images/test.jpg" /><figcaption class="overlay-panel overlay-panel-fullheight"><span>My text</span></figcaption></figure>
  # With icon and full height 
  #   <%= render Itacomp::OverlayComponent.new('test.jpg', text: 'My text', icon: 'lock', full: true) %>
  #   <figure class="overlay-wrapper"><img src="/images/test.jpg" /><figcaption class="overlay-panel overlay-panel-fullheight"><span class="visually-hidden">my text</span><svg class="icon"><use href="/itacomp/sprites.svg#lock" xlink:href="/itacomp/sprites.svg#lock" /></svg></figcaption></figure>
  # With content
  #   <%= render Itacomp::OverlayComponent.new('test.jpg').with_content('My text') %>
  #   <figure class="overlay-wrapper"><img src="/images/test.jpg" /><figcaption class="overlay-panel"><span>My text</span></figcaption></figure>
  class OverlayComponent < ApplicationComponent
    # Initialize Overlay component
    # ==== Options
    # * <tt>img</tt> [String], mandatory, default: <tt>nil</tt>, image url or asset;
    # * <tt>text</tt> [String], default <tt>nil</tt>, Overlay span content
    # * <tt>icon</tt> [String] default <tt>nil</tt> if present is add icon content in overlay
    # * <tt>black</tt> [Boolean] default <tt>false</tt> if true add overlay-black class
    # * <tt>full</tt> [Boolean] default <tt>false</tt> if true add overlay-panel-fullheight clas
    # * <tt>**opts</tt> each key is delegated as image_tag options. Default: {}, useful for add class or alternate image description
    # * <tt>yield</tt> figcaption content in a span tag 
    def initialize(img = nil, text: nil, icon: nil, black: false, full: false, **opts)
      @opts = opts
      @figcaption_opts = {class: ['overlay-panel', if_key('overlay-panel-fullheight', full), if_key('overlay-black', black), if_key('overlay-icon', icon.present?)]}

      @text = text
      @img = img
      @icon = icon
    end
  end
end
