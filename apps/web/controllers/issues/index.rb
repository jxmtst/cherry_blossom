module Web
  module Controllers
    module Issues
      class Index
        include Web::Action

        expose :issues

        def call(params)
          @issues = IssueRepository.new.all
        end
      end
    end
  end
end
