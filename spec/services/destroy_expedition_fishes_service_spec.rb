describe DestroyExpeditionFishesService do
  let!(:expedition) { create(:expedition) }
  let!(:fish) { create(:fish) }
  let!(:expedition_fish1) { create(:expedition_fish, length: 5, weight: 2.5, expedition: expedition, fish_id: fish.id) }
  let!(:expedition_fish2) { create(:expedition_fish, length: 10, weight: 3, expedition: expedition, fish_id: fish.id) }

  it 'destroy 2 records' do
    service = DestroyExpeditionFishesService.new(expedition, [expedition_fish1.id, expedition_fish2.id])
    expect { service.call }.to change(ExpeditionFish, :count).by(-2)
  end

  context 'create CatchCache' do #move tests to UpdateCatchCacheService specs
    let!(:catch_cache) { create(:catch_cache, length: "5-10", weight: '2.5-3', count: 2, catchable: expedition, fish_id: fish.id)}

    it 'set correct count' do
      service = DestroyExpeditionFishesService.new(expedition, [expedition_fish1.id])
      service.call
      catch_cache.reload
      expect(catch_cache.count).to eq(1)
    end

    it 'set correct weight' do
      service = DestroyExpeditionFishesService.new(expedition, [expedition_fish1.id])
      service.call
      catch_cache.reload
      expect(catch_cache.length).to eq('10')
    end

    it 'set correct length' do
      service = DestroyExpeditionFishesService.new(expedition, [expedition_fish1.id])
      service.call
      catch_cache.reload
      expect(catch_cache.weight).to eq('3.0')
    end
  end
end