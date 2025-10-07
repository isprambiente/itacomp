# frozen_string_literal: true

module Itacomp
  # make a strcture for [notification component](https://italia.github.io/bootstrap-italia/docs/componenti/notification/)
  # ==== Example
  # With only required title (default show and dismissable)
  #   <%= render Itacomp::NotificationComponent.new(title: 'test') %>
  #   <div class="notification dismissable show" id="not-172739516" aria-labelledby="not-172739516-title" role="alert" style="display: block;">  <h2 id="not-172739516-title" class="h5">test</h2>      <button class="btn notification-close" data-bs-toggle="notification" data-bs-target="#not-172739516">      <svg class="icon"><use href="/itacomp/sprites.svg#it-close" xlink:href="/itacomp/sprites.svg#it-close" /></svg>      <span class="visually-hidden">close notification: test</span></button></div>
  # Mo dismissable and no show
  #  <%= render Itacomp::NotificationComponent.new(title: 'test', dismissable: false, show: false) %>
  #  <div class="notification" id="not-171959203" aria-labelledby="not-171959203-title" role="alert">  <h2 id="not-171959203-title" class="h5">test</h2> </div>
  class NotificationComponent < ApplicationComponent
    # Initialize notification component
    #
    # ==== Options
    # * <tt>title</tt> [String], mandatory, default: <tt>nil</tt>, Notification title;
    # * <tt>show</tt> [Boolean], default <tt>true</tt>, if true set notification visible
    # * <tt>icon</tt> [String] default <tt>nil</tt> if present is add nontification icon
    # * <tt>dismissable</tt> [Boolean] default <tt>true</tt> if true add dismiss button
    # * <tt>**opts</tt> each key is delegated as tag options. Default: {class: 'notification', id: Time.now.strftime("%H%M%S%L"), aria: {role: 'alert'}}
    # * <tt>yield</tt> notification content (content is automarically added in a `p` tag)
    def initialize(title:, show: true, icon: nil, dismissable: true, **opts)
      opts[:class] = [ "notification", opts[:class] ]
      opts[:class] << "with-icon" if icon.present?
      opts[:class] << "dismissable" if dismissable == true
      opts[:id] = "not-#{Time.now.strftime("%H%M%S%L")}" if opts[:id].blank?
      opts[:aria] = { labelledby: "#{opts[:id]}-title" } if opts[:aria].blank?
      opts[:role] = "alert"
      if show == true
        opts[:class] << "show"
        opts[:style] = "display: block;"
      end
      @title = title
      @icon = icon
      @dismissable = dismissable
      @opts = opts
    end

    # return full title: text and optional icon
    def full_title
      @icon.present? ? safe_join([ ita_icon(@icon), @title ]) : @title
    end
  end
end
