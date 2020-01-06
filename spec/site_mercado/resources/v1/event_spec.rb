require 'spec_helper'

RSpec.describe SiteMercado::Event do
  describe '#all' do
    let(:response) { build_list(:event, 5, :response).map(&:marshal_dump) }
    let(:events) { response.map { |event| SiteMercado::Entities::Event.new(event) } }

    before { allow(SiteMercado::Client).to receive(:get).and_return(response) }

    subject { described_class.all }

    it 'calls get /pedido/eventos' do
      expect(SiteMercado::Client).to(
        receive(:get)
          .once
          .with('/pedido/eventos')
      )
      subject
    end

    it 'returns a list of events' do
      expect(described_class.all).to match_array(
        events.map do |event|
          have_attributes(
            class: SiteMercado::Entities::Event,
            id: event.id,
            order_id: event.order_id,
            state: event.state,
            shop_id: event.shop_id
          )
        end
      )
    end
  end

  describe '#find_by_shop_id' do
    let(:shop_id) { Faker::Number.number }
    let(:response) { build_list(:event, 5, :response).map(&:marshal_dump) }
    let(:events) { response.map { |event| SiteMercado::Entities::Event.new(event) } }

    before { allow(SiteMercado::Client).to receive(:get).and_return(response) }

    subject { described_class.find_by_shop_id(shop_id) }

    it 'calls get /pedido/eventos/:shop_id' do
      expect(SiteMercado::Client).to(
        receive(:get)
          .once
          .with("/pedido/eventos/#{shop_id}")
          .and_return(response)
      )
      subject
    end

    it 'returns events from the shop' do
      expect(subject).to match_array(
        events.map do |event|
          have_attributes(
            class: SiteMercado::Entities::Event,
            id: event.id,
            order_id: event.order_id,
            state: event.state,
            shop_id: event.shop_id
          )
        end
      )
    end
  end

  describe '#check_event' do
    let(:events) { build_list(:event, 5, :response) }
    before { allow(SiteMercado::Client).to receive(:post) }

    subject { described_class.check_event(ids) }

    context 'when array of ids' do
      let(:ids) { events.map(&:id) }
      let(:body) { ids.map { |id| { id: id } } }

      it 'calls post /pedido/eventos/verificado' do
        expect(SiteMercado::Client).to(
          receive(:post)
          .once
          .with('/pedido/eventos/verificado', body)
        )
        subject
      end
    end

    context 'when integer' do
      let(:ids) { Faker::Number.number }
      let(:body) { [id: ids] }

      it 'calls post /pedido/eventos/verificado' do
        expect(SiteMercado::Client).to(
          receive(:post)
          .once
          .with('/pedido/eventos/verificado', body)
        )
        subject
      end
    end

    context 'when string' do
      let(:ids) { Faker::Number.number.to_s }
      let(:body) { [id: ids] }

      it 'calls post /pedido/eventos/verificado' do
        expect(SiteMercado::Client).to(
          receive(:post)
          .once
          .with('/pedido/eventos/verificado', body)
        )
        subject
      end
    end

    context 'when nether one' do
      let(:ids) {}
      let(:body) { [{}] }

      it 'calls post /pedido/eventos/verificado' do
        expect(SiteMercado::Client).to(
          receive(:post)
          .once
          .with('/pedido/eventos/verificado', body)
        )
        subject
      end
    end
  end
end
