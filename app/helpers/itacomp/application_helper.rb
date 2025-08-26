module Itacomp
  # shared data fot all Itacomp Helpers
  module ApplicationHelper
    # this constant define available bootstrap-italia type
    ITA_TYPES = Hash.new { :primary }.with_indifferent_access.merge(primary: "primary", info: "info", success: "success", warning: "warning", danger: "danger")
  end
end
