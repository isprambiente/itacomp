# frozen_string_literal: true

module Itacomp
  class AvatarComponent < BaseComponent
    def initialize(size: nil, bg: nil, class: nil ,**opts)
      opts[:class] = ["avatar", opts[:class]]
      opts[:class] << ita_size(size) if size.present?
      opts[:class] << avatar_bg(bg) if bg.present?
      @opts = opts
    end

    def avatar_bg(bg)
      "avatar-#{ITA_TYPES[bg]}"
    end
  end
end
