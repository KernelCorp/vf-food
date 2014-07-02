#This code avoids no method: 'object' error that appears on some machines
#TODO: Remove this file to activate AA filters.
module ActiveAdmin
  module Filters
    module FormtasticAddons
      def klass
        @object.class
      end

      def polymorphic_foreign_type?(method)
        false
      end
    end
  end
end