module Web
  module Views
    module Issues
      class Index
        include Web::View
        layout :application

        def footer
          raw('footer')
        end
      end
    end
  end
end
