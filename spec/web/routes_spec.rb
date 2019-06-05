require 'spec_helper'

RSpec.describe Web.routes do
  it 'generates "/books/23"' do
    actual = described_class.path(:books, id: 23)
    expect(actual).to eq('/books/23')
  end
end
