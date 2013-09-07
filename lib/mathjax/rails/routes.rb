module Mathjax
  module Rails
    module RouterMethods
      def mathjax(str)
        get "#{str}/*uri" => "mathjax_rails#give_out_static_file",:as=>'mathjax'
      end
    end
  end
end
ActionDispatch::Routing::Mapper.send :include,Mathjax::Rails::RouterMethods