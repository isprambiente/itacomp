# frozen_string_literal: true

module Itacomp
  # make a strcture for [tab component](https://italia.github.io/bootstrap-italia/docs/componenti/tab/)
  # ==== Example
  # With no params return an empty tab container
  #   <%= render Itacomp::TabComponent.new %>
  #   <ul class="nav nav-tabs" role="tablist"></ul>
  # With options on container
  #   <%= render Itacomp::TabComponent.new(class: 'top-tab', data: {enabled: true}) %>
  #   <ul class="nav nav-tabs top-tab" role="tablist" data-enabled="true"></ul>
  # with some entries
  #   <%= render Itacomp::TabComponent.new([["Home", root_path], active: true, ["Books", books_path]]) %>
  #   <ul class="nav nav-tabs" role="tablist">
  #     <li class="nav-item"><a class="nav-link active" role="tab" href="/">Home</a></li>
  #     <li class="nav-item"><a class="nav-link" role="tab" href="/books">Books</a></li>
  #   </ul>
  class TabComponent < ViewComponent::Base
    # Initialize tab component
    #
    # ==== options
    # * <tt>entries</tt> array of tabs, read "entries structure"
    # * <tt>**opts</tt> each key is delegated as ul tag options
    # * <tt>yield</tt> Alternative tabs content
    #
    # ==== Entries structure
    # Entries is an Array of tab option. A tab is structured with
    # * <tt>text</tt>, default nil, html link content (you can include icon too)
    # * <tt>url</tt>, default nil, destination link url
    # * <tt>**opts</tt> each key is delegated as link_to options
    def initialize(entries = [], **opts)
      opts[:class] = [ "nav nav-tabs", opts[:class] ]
      opts[:role] = "tablist"
      @opts = opts
      @entries = entries
    end

    # Return html for a tab.
    # The container tag li have class "nav-item"
    # The link have class "nav-link", other class are append after this.
    # The link have role "tab"
    #
    # ==== Options
    # * <tt>text</tt>, default nil, html link content (you can include icon too)
    # * <tt>url</tt>, default nil, Destination link utl
    # * <tt>**opts</tt> each key is delegated as link_to options
    #
    # ==== Example
    #   tab('test', root_path, class: 'mytab')
    #   <li class="nav-item"><a class="nav-link mytab" role="tab" href="/">test</a></li>
    def tab(text = nil, url = nil, **opts)
      opts[:class] = [ "nav-link", opts[:class] ]
      opts[:role] = "tab"
      tag.li(link_to(text, url, **opts), class: "nav-item")
    end

    # From entried return an array of tab
    #
    # === Options
    # * <tt>entries</tt>, default @entries, array of tab
    def tabs(entries = @entries)
      safe_join(entries.map { |e| tab(e[0], e[1], **e[2]) })
    end
  end
end
