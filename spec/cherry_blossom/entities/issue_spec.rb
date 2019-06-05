RSpec.describe Issue, type: :entity do
  describe 'parent?' do
    subject do
      described_class.new(title: 'title', author: 'jxmtst')
    end
    it { expect(subject.parent?).to eq(true) }
  end
end
