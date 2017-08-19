module Extensions
  module OpenStruct
    module Format
      def to_json
        table.to_json
      end
    end
  end
end
