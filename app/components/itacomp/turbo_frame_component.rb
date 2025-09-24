# frozen_string_literal: true

module Itacomp
  # Make a bootstrap-italia compatible structure for a [turbo Frame](https://turbo.hotwired.dev/handbook/frames) tag.
  #
  # ==== Example
  # Empty turbo frame
  #   = render Itacomp::TurboFrameComponent.new
  #
  #   <turbo-frame></turbo-frame>
  #
  # Each arguments key is passed to turbo-frame tag
  #   = render Itacomp::TurboFrameComponent.new(id: 'test', class: 'primary')
  #
  #   <turbo-frame id='test' class='primary'></turbo-frame>
  #
  # Turbo fram with block content
  #   = render Itacomp::TurboFrameComponent.new(id: 'test', class: 'primary') do
  #     <p>text content</p>
  #
  #   <turbo-frame id='test' class='primary'><p>test content</p></turbo-frame>
  #
  # With id and src (to load remote content) and no block content is automatically added a load icon
  #   = render Itacomp::TurboFrameComponent.new(id: 'nav1', src: books_path )
  #
  #   <turbo-frame id='nav1' src='/books'>
  #     <div class="progress-spinner progress-spinner-active">
  #       <span class="visually-hidden">Caricamento...</span>
  #     </div>
  #   </turbo-frame>
  #
  # With id, src and block content
  #   = render Itacomp::TurboFrameComponent.new(id: 'nav1', src: books_path ) do
  #     text content
  #
  #   <turbo-frame id='nav1' src='/books'>text content</turbo-frame>
  class TurboFrameComponent < BaseComponent
    # Initialize TurboFrameComponent
    # ==== Options
    # * <tt>*</tt> [Symbol], each key going as tag option
    # * <tt>yield</yy> optional turbo frame content
    def initialize(**keys)
      @busy = keys[:href].present? && content.blank?
      @keys = keys
      @keys[:aria] = { busy: true } if @busy
    end
  end
end
