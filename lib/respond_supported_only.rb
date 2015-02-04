require "respond_supported_only/version"

module RespondSupportedOnly
  extend ActiveSupport::Concern

  class AcceptableFormats
    def initialize(formats)
      @formats = formats
    end

    def before(controller)
      unless acceptable?(controller.request.formats)
        controller.head(:not_acceptable)
      end
    end

    private

    def acceptable?(requested_formats)
      requested_formats.any? {|type| type.ref == '*/*' } ||
      requested_formats === @formats
    end
  end

  module ClassMethods
    def respond_only(*formats)
      options = formats.extract_options!

      before_action AcceptableFormats.new(formats), options
    end
  end
end
