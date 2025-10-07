# frozen_string_literal: true

module Itacomp
  # make a strcture for [alert component](https://italia.github.io/bootstrap-italia/docs/componenti/alert/)
  #
  # @example with no options
  #   <%= render ItacompAlertComponent.new %>
  #   <div class="alert alert-primary" role="alert"></div>
  # @example with text as block
  #   <%= render ItacompAlertComponent.new do %>
  #     text
  #   <% end %>
  #   <div class="alert alert-primary" role="alert">text</div>
  # @example with closable alert
  #   <%= render ItacompAlertComponent.new(close: true) %>
  #   <div class="alert alert-primary alert-dismissible fade show" role="alert">
  #     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Chiudi avviso">
  #       <svg class="icon"><use href="/assets/itacomp/sprites-c1ca51b0.svg#it-close" xlink:href="/assets/itacomp/sprites-c1ca51b0.svg#it-close"></use></svg>
  #     </button>
  #   </div>
  # @example with oter alert type (primary, info, success, warning, alert )
  #   <%= render ItacompAlertComponent.new(type: :info) %>
  #   <div class="alert alert-info" role="alert"></div>
  # @exaple with additional class
  #   <%= render ItacompAlertComponent.new(class: 'pretty-class') %>
  #   <div class="alert alert-primary pretty-class" role="alert"></div>
  # @example with other key params
  #   <%= render ItacompAlertComponent.new(id: 'my-id', data: {test: 'test'}) %>
  #   <div class="alert alert-primary" id="my-id" data-test="test" role="alert"></div>
  class AlertComponent < ApplicationComponent
    # @param [String,Sym] :type of alert, default 'primary'
    # @param [Boolean] :close if true is added close button
    # @param [String] :class add other class after "alsert alert-#{type}" classes
    # @param [Hash] **opts each other oprion is delegated to container tag
    # @yield [optional] turbo frame content
    def initialize(type: :primary, close: false, **opts)
      @close = close
      @opts = opts
      @opts[:class] = [ "alert", "alert-#{ITA_TYPES[type]}", @opts[:class] ]
      @opts[:class] << "alert-dismissible fade show" if close
      @opts[:role] = "alert"
    end

    # @return html for close button if @close is true
    def close_button
      tag.button ita_icon("it-close"), type: "button", class: "btn-close", data: { bs_dismiss: "alert" }, aria: { label: t(".label") } if @close
    end
  end
end
