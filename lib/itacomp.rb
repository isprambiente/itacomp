require "itacomp/version"
require "itacomp/engine"

module Itacomp
  # this constant define available bootstrap-italia type
  ITA_TYPES = Hash.new { :primary }.with_indifferent_access.merge(primary: "primary", info: "info", success: "success", warning: "warning", danger: "danger")
end
