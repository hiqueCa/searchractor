require 'searchractor'

describe Searchractor do
  let(:searchable_class) { Class.new.send(:include, described_class) }
  let(:elements_list) { [1, 2, 3, 4, 5, 10] }

  before do
    searchable_class.define_method(:initialize) { |list| @list = list }
  end

  describe '#b_search' do
    subject do
      searchable_class.new(elements_list).b_search(searched_element)
    end

    context 'when searched element is present in elements list' do
      let(:searched_element) { 2 }

      it { is_expected.to eq(elements_list.index(searched_element)) }
    end

    context 'when searched element is not present in elements list' do
      let(:searched_element) { 6 }

      it { is_expected.to be_nil }
    end
  end
end
