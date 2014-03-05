module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Numbers
      # Name of the component method
      def number
        @number ||= begin
          options[:number].to_s.html_safe if options[:number].present?
        end
      end

      # Used when the number is optional
      def has_number?
        number.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Numbers)