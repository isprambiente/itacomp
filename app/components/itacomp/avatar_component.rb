# frozen_string_literal: true

module Itacomp
  # Make a bootstrap-italia compatible [Avatar](https://italia.github.io/bootstrap-italia/docs/componenti/avatar/) tag.
  #
  # ==== Example
  # With no params
  #   <%= render Itacomp::Avatar.new %>
  #   <div class=\"avatar\"></div>
  # With content
  #   <%= render itacomp::avatar.new.with_content('a') %>
  #   <div class="avatar">a</div>
  # With content
  #   <%= render Itacomp::Avatar.new.with_content(image_tag(@user.avatar)) %>
  #   <div class="avatar">A</div>
  # With yield content
  #   <%= render Itacomp::Avatar.new do %>
  #     <% if @user.avatar.present? %>
  #       <%= image_tag @user.avatar %>
  #     <% else %>
  #       <%= @user.name.first %>
  #     <% end %>
  #   <% end %>
  #   <div class="avatar">A</div>
  # With size options (:xs, :sm, :md, :lg, :xl, :xxl)
  #   <%= render itacomp::avatar(size: :xs).new.with_content('a') %>
  #   <div class="avatar size-xs">a</div>
  # With bg options (:primary, :secondary, ecc.)
  #   <%= render itacomp::avatar(bg: :primary).new.with_content('a') %>
  #   <div class="avatar avatar-primary">a</div>
  # With additional class
  #   <%= render itacomp::avatar(class: 'test').new.with_content('a') %>
  #   <div class="avatar test">a</div>
  # With other options
  #   <%= render itacomp::avatar(id: "my_avatar", data: {turbo_frame: 'main'}).new.with_content('a') %>
  #   <div id="my_avatar" class="avatar" data-turbo-frame="main">a</div>
  class AvatarComponent < ApplicationComponent
    # Initialize avatar component
    #
    # ==== Options
    # * <tt>size</tt> [Symbol,String], default: <tt>nil</tt>, add ita_size style
    # * <tt>bg</tt> [Symbol,String], default <tt>nil</tt>, add avatar_bg style
    # * <tt>class</tt> [String,Array] default <tt>nil</tt> if present is add class style after <tt>avatar</tt>
    # * <tt>**opts</tt> each key is delegated as tag options
    # * <tt>yield</tt> avatar content
    def initialize(size: nil, bg: nil, class: nil, **opts)
      opts[:class] = [ "avatar", opts[:class] ]
      opts[:class] << ita_size(size) if size.present?
      opts[:class] << avatar_bg(bg) if bg.present?
      @opts = opts
    end

    # generate avatar backgrond class from ITA_TYPES
    #
    # ==== Options
    # * <tt>bg</tt> [Symbol,String], string to make avatar backgrond class
    def avatar_bg(bg)
      "avatar-#{ITA_TYPES[bg]}"
    end
  end
end
