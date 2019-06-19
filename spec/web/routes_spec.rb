#     issues GET, HEAD  /issues                        Web::Controllers::Issues::Index
#  new_issue GET, HEAD  /issues/new                    Web::Controllers::Issues::New
#     issues POST       /issues                        Web::Controllers::Issues::Create
#      issue GET, HEAD  /issues/:id                    Web::Controllers::Issues::Show
# edit_issue GET, HEAD  /issues/:id/edit               Web::Controllers::Issues::Edit
#      issue PATCH      /issues/:id                    Web::Controllers::Issues::Update
#      issue DELETE     /issues/:id                    Web::Controllers::Issues::Destroy
RSpec.describe Web.routes do
  it 'generates "/issues"' do
    subject = described_class.path(:issues)
    expect(subject).to eq('/issues')
  end

  it 'generates "/issues/23"' do
    subject = described_class.path(:issue, id: 23)
    expect(subject).to eq('/issues/23')
  end

  it 'recognizes "PATCH /issues/23"' do
    # pending 'Route Recognition cf) https://guides.hanamirb.org/routing/testing/'
    env   = Rack::MockRequest.env_for('/issues/23', method: 'PATCH')
    route = described_class.recognize(env)

    # expect(route.routable?).to be(true) # => false

    expect(route.path).to   eq('/issues/23')
    expect(route.verb).to   eq('PATCH')
    expect(route.params).to eq(id: '23')
  end
end
