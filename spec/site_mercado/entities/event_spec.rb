# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SiteMercado::Entities::Event do
  it_behaves_like 'entity_attributes', %i[
    id
    codigoPedido
    status
    idLoja
  ]

  describe '.invoiced?' do
    context 'when invoiced' do
      let(:event) { build(:event, :invoiced) }

      subject { event.invoiced? }

      it { is_expected.to eq true }
    end

    context 'when not invoiced' do
      let(:event) { build(:event, :in_separation) }

      subject { event.invoiced? }

      it { is_expected.to eq false }
    end
  end

  describe '.in_separation?' do
    context 'when in_separation' do
      let(:event) { build(:event, :in_separation) }

      subject { event.in_separation? }

      it { is_expected.to eq true }
    end

    context 'when not in_separation' do
      let(:event) { build(:event, :awaiting_delivery) }

      subject { event.in_separation? }

      it { is_expected.to eq false }
    end
  end

  describe '.awaiting_delivery?' do
    context 'when awaiting_delivery' do
      let(:event) { build(:event, :awaiting_delivery) }

      subject { event.awaiting_delivery? }

      it { is_expected.to eq true }
    end

    context 'when not awaiting_delivery' do
      let(:event) { build(:event, :awaiting_withdrawal) }

      subject { event.awaiting_delivery? }

      it { is_expected.to eq false }
    end
  end

  describe '.awaiting_withdrawal?' do
    context 'when awaiting_withdrawal' do
      let(:event) { build(:event, :awaiting_withdrawal) }

      subject { event.awaiting_withdrawal? }

      it { is_expected.to eq true }
    end

    context 'when not awaiting_withdrawal' do
      let(:event) { build(:event, :awaiting_export) }

      subject { event.awaiting_withdrawal? }

      it { is_expected.to eq false }
    end
  end

  describe '.awaiting_export?' do
    context 'when awaiting_export' do
      let(:event) { build(:event, :awaiting_export) }

      subject { event.awaiting_export? }

      it { is_expected.to eq true }
    end

    context 'when not awaiting_export' do
      let(:event) { build(:event, :exported) }

      subject { event.awaiting_export? }

      it { is_expected.to eq false }
    end
  end

  describe '.exported?' do
    context 'when exported' do
      let(:event) { build(:event, :exported) }

      subject { event.exported? }

      it { is_expected.to eq true }
    end

    context 'when not exported' do
      let(:event) { build(:event, :canceled) }

      subject { event.exported? }

      it { is_expected.to eq false }
    end
  end

  describe '.canceled?' do
    context 'when canceled' do
      let(:event) { build(:event, :canceled) }

      subject { event.canceled? }

      it { is_expected.to eq true }
    end

    context 'when not canceled' do
      let(:event) { build(:event, :invoiced) }

      subject { event.canceled? }

      it { is_expected.to eq false }
    end
  end

  describe '.finished?' do
    context 'when finished' do
      let(:event) { build(:event, :finished) }

      subject { event.finished? }

      it { is_expected.to eq true }
    end

    context 'when not finished' do
      let(:event) { build(:event, :invoiced) }

      subject { event.finished? }

      it { is_expected.to eq false }
    end
  end
end
