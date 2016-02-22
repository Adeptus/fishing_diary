describe UpdateCatchCacheService do
  it 'create cache' do
    expedition = create(:expedition)
    fish = create(:fish)
    create(:expedition_fish, expedition: expedition, fish: fish)

    service = UpdateCatchCacheService.new(fish.id, expedition)
    expect{ service.call }.to change(CatchCache, :count).by(1)
  end

  it 'create 2 cache when method_id' do
    expedition = create(:expedition)
    fish = create(:fish)
    method = create(:catch_method)
    create(:expedition_fish, expedition: expedition, fish: fish, method: method)

    service = UpdateCatchCacheService.new(fish.id, expedition, [method.id])
    expect{ service.call }.to change(CatchCache, :count).by(2)
  end

  it 'update all cache when method_ids id all' do
    expedition = create(:expedition)
    fish = create(:fish)
    method = create(:catch_method)
    method2 = create(:catch_method)
    create(:expedition_fish, expedition: expedition, fish: fish, method: method)
    catch_cache = create(:catch_cache, catchable: expedition, fish: fish, method: method)
    create(:expedition_fish, expedition: expedition, fish: fish, method: method2)

    service = UpdateCatchCacheService.new(fish.id, expedition, :all)
    service.call
    expect( CatchCache.count ).to eq(3)
  end

end
