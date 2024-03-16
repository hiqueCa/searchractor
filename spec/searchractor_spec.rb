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

    context 'when a non-sorted list of elements is searched through' do
      let(:searched_element) { 2 }
      let(:elements_list) { [2, 1, 5, 3, 8] }

      it 'raises an Searchractor::ElementsListNotSorted error' do
        expect { subject }.to raise_error(Searchractor::ListNotSortedError, 'The list of elements is not sorted.')
      end
    end
  end

  describe '#l_search' do
    subject do
      searchable_class.new(elements_list).l_search(searched_element)
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
