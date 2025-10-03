# frozen_string_literal: true

module Itacomp
  # make a strcture for [dimmer component](https://italia.github.io/bootstrap-italia/docs/componenti/dimmer/)
  # ==== Example
  # With no params
  #   <%= render Itacomp::DimmerComponent.new() %>
  #   <div class="dimmable">
  #     <div class="dimmer fade show" id="dimmer-125408335">
  #       <div class="dimmer-inner"></div>
  #     </div>
  #   </div>
  #
  # With option show false (default true)
  #   <%= render Itacomp::DimmerComponent.new(show: false) %>
  #   <div class="dimmable">
  #     <div class="dimmer fade" id="dimmer-125408335" aria-hidden="true">
  #       <div class="dimmer-inner"></div>
  #     </div>
  #   </div>
  #
  # With options in dimmable tag
  #   <%= render Itacomp::DimmerComponent.new(class: 'my-class', data: {action: none}) %>
  #   <div class="dimmable myclass" data-action="none">
  #     <div class="dimmer fade show" id="dimmer-125408335">
  #       <div class="dimmer-inner"></div>
  #     </div>
  #   </div>
  #
  # With simple dimmer icon and text
  #   <%= render Itacomp::DimmerComponent.new(icon: 'it-unlocked', text: 'text') %>
  #   <div class="dimmable">
  #     <div class="dimmer fade show" id="dimmer-125408335">
  #       <div class="dimmer-inner">
  #         <div class="dimmer-icon"><svg class="icon icon-xl"><use href="/itacomp/sprites.svg#unlocked" xlink:href="/itacomp/sprites.svg#unlocked" /></svg></div>
  #         <p>test</p>
  #       </div>
  #     </div>
  #   </div>
  #
  # With dimmer div options
  #   <%= render Itacomp::DimmerComponent.new(dimmer: {id: 'my-dimmer', class: 'my-dimmer-class', data: {test: 'tost'}}) %>
  #   <div class="dimmable">
  #     <div class="dimmer fade my-dimmer-class show" id="my-dymmer" data-test="tost">
  #       <div class="dimmer-inner"></div>
  #     </div>
  #   </div>
  #
  # with free dimmable content
  # <%= render Itacomp::DimmerComponent.new() do %>
  #   <h4>my dimmable content</h4>
  # <% end %>
  #   <div class="dimmable">
  #     <div class="dimmer fade show" id="dimmer-125408335">
  #       <div class="dimmer-inner"></div>
  #     </div>
  #     <h4>my dimmable content</h4>
  #   </div>
  #
  # with free dimmer content
  # <%= render Itacomp::DimmerComponent.new() do |component| %>
  #   <% component.with_inner_content do%>
  #     <h4>My dimmer content</h4>
  #   <% end %>
  #   <h4>my dimmable content</h4>
  # <% end %>
  #   <div class="dimmable">
  #     <div class="dimmer fade show" id="dimmer-125408335">
  #       <div class="dimmer-inner">
  #         <h4>My mimmer content</h4>
  #       </div>
  #     </div>
  #     <h4>my dimmable content</h4>
  #   </div>
  class DimmerComponent < BaseComponent
    renders_one :inner_content
    # Initialize dimmer component
    #
    # ==== Options
    # * <tt>show</tt> [Boolean], default: <tt>true</tt>, add show class on dimmer element
    # * <tt>icon</tt> [String] default <tt>nil</tt> if present add a dimmer_icon in dimmer element
    # * <tt>text</tt> [Atring] default <tt>nil</tt> if present add a p tag with the content in dimmer element
    # * <tt>dimmer</tt> [Hash], default <tt>{id: "dimmer_#{Time.now.strftime("%H%M%S%L"}"}</tt>, each key present in this hash is passed as tag option for dimmer element,
    # * <tt>**opts</tt> each key is delegated as tag options for dimmable element.
    # * <tt>yield</tt> dimmable content, is added in dimmable element after dimmer element
    # * <tt>yield.with_dimmer_content</tt> dimmer content, is added into dimmer element
    #
    # ==== Note
    # you can set an arbitrary ID in dimmer element to activate it with javascript:
    #   render Itacomp::DimmerComponent.new(dimmer: {id: 'my-dimmer'})
    #
    # To add arbitrary code in dimmer element you can use self.dimmer_content:
    #  render Itacomp::DimmerComponent.new do |component|
    #    component.with_inner_content do
    #      "my dimmer content"
    #     end
    def initialize(show: true, icon: nil, text: nil, dimmer: {}, **opts)
      @dimmable = opts
      @dimmable[:class] = [ "dimmable", opts[:class] ]
      @dimmer = dimmer
      @dimmer[:class] = [ "dimmer fade", @dimmer[:class] ]
      @dimmer["id"] = "dimmer-#{Time.now.strftime("%H%M%S%L")}" if @dimmer[:id].blank?
      show == true ? @dimmer[:class] << "show" : @dimmer[:aria] = { hidden: true }
      @icon = icon
      @text = text
    end

    # helper to add a dimmer icon
    #
    # ==== Options
    # * <tt>dicon</tt> [String], ita_icon id to render an icon
    # * <tt>**opts</tt> each key is delegated as tag options for icon element.
    def dimmer_icon(icon, **opts)
      opts = { class: "icon-xl" }.merge opts
      tag.div ita_icon(@icon, **opts), class: "dimmer-icon"
    end
  end
end
