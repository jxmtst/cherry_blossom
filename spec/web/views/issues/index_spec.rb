RSpec.describe Web::Views::Issues::Index, type: :view do
  let(:exposures) { Hash[format: :html, issues: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/issues/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'include footer' do
    expect(view.render).to match(%(footer))
  end
end
