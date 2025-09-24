require "itacomp/version"
require "itacomp/engine"

module Itacomp
  # this constant define available bootstrap-italia type
  ITA_TYPES = Hash.new { :primary }.with_indifferent_access.merge(primary: "primary", secondary: "secondary", info: "info", success: "success", warning: "warning", danger: "danger", white: "white", dark: "dark", black: "black")
  ITA_SIZES = Hash.new { :md }.with_indifferent_access.merge(xs: "xs", sm: "sm", md: "md", lg: "md", xl: "xl", xxl: "xxl")
end
