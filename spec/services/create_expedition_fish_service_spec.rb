describe CreateExpeditionFishService do
  let(:expedition) { create(:expedition) }
  let(:form) { double(
    valid?: true,
    count: 100,
    fish_id: '1',
    expedition_id: expedition.id,
    length: '10-20',
    weight: '1.6-2',
    notes: 'asdasdas',
    user_id: '1',
    bait_id: '1'
  ) }

  it 'create 100 records' do
    service = CreateExpeditionFishService.new(expedition, form)
    expect { service.call }.to change(ExpeditionFish, :count).by(100)
  end


  context 'create CatchCache' do
    it 'create CatchCache' do
      service = CreateExpeditionFishService.new(expedition, form)
      expect { service.call }.to change(CatchCache, :count).by(1)
    end

    it 'set correct count' do
      service = CreateExpeditionFishService.new(expedition, form)
      service.call
      catch_cache = CatchCache.last
      expect(catch_cache.count).to eq(100)
    end

    it 'set correct weight' do
      service = CreateExpeditionFishService.new(expedition, form)
      service.call
      catch_cache = CatchCache.last
      expect(catch_cache.length).to eq('10-20')
    end

    it 'set correct length' do
      service = CreateExpeditionFishService.new(expedition, form)
      service.call
      catch_cache = CatchCache.last
      expect(catch_cache.weight).to eq('1.6-2.0')
    end
  end
end