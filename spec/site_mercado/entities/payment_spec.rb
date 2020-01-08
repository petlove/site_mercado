require 'spec_helper'

RSpec.describe SiteMercado::Entities::Order do
  describe '.offline?' do
    subject { payment.offline? }

    context 'when offline' do
      let(:payment) { build(:payment, :offline) }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end
    context 'when online' do
      let(:payment) { build(:payment, :online) }

      it 'returns false' do
        is_expected.to be_falsey
      end
    end
  end

  describe '.online?' do
    subject { payment.online? }

    context 'when offline' do
      let(:payment) { build(:payment, :offline) }

      it 'returns false' do
        is_expected.to be_falsey
      end
    end
    context 'when online' do
      let(:payment) { build(:payment, :online) }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end
  end
end
