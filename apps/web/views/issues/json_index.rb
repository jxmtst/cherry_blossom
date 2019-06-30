module Web
  module Views
    module Issues
      class JsonIndex < Index
        format :json

        def render
          raw JSON.generate({foo: 'bar'})
        end
      end
    end
  end
end
