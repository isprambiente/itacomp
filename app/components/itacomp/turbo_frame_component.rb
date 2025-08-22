# frozen_string_literal: true

module Itacomp
  # Make a bootstrap-italia compatible structure for a [turbo Frame](https://turbo.hotwired.dev/handbook/frames) tag.
  #
  # @example empty turbo frame
  #   = render Itacomp::TurboFrameComponent.new
  #
  #   <turbo-frame></turbo-frame>
  #
  # @example each arguments key is passed to turbo-frame tag
  #   = render Itacomp::TurboFrameComponent.new(id: 'test', class: 'primary')
  #
  #   <turbo-frame id='test' class='primary'></turbo-frame>
  #
  # @example turbo fram with block content
  #   = render Itacomp::TurboFrameComponent.new(id: 'test', class: 'primary') do
  #     <p>text content</p>
  #
  #   <turbo-frame id='test' class='primary'><p>test content</p></turbo-frame>
  #
  # @example with id and src (to load remote content) and no block content is automatically added a load icon
  #   = render Itacomp::TurboFrameComponent.new(id: 'nav1', src: books_path )
  #
  #   <turbo-frame id='nav1' src='/books'>
  #     <div class="progress-spinner progress-spinner-active">
  #       <span class="visually-hidden">Caricamento...</span>
  #     </div>
  #   </turbo-frame>
  #
  # @example with id, src and block content
  #   = render Itacomp::TurboFrameComponent.new(id: 'nav1', src: books_path ) do
  #     text content
  #
  #   <turbo-frame id='nav1' src='/books'>text content</turbo-frame>
  class TurboFrameComponent < ViewComponent::Base
    # @option opts [String] :*
    #   each other key going as tag option
    # @yield [optional] turbo frame content
    def initialize(**keys)
      @keys = keys
    end
  end
end
