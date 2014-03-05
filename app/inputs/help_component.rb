module SimpleForm 
  module Components 
    module Description
      def description
        "Hello There!!!"
      end
    end
  end
  module Inputs 
    class Base 
      include SimpleForm::Components::Description
    end 
  end 
end