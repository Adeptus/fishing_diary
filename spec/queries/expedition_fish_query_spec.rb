describe ExpeditionFishQuery do
  it 'default order(length)' do
    catch1 = create(:expedition_fish, length: 10)
    catch2 = create(:expedition_fish, length: 20)

    results = ExpeditionFishQuery.new({}).results
    expect(results).to eq([catch2, catch1])
  end

  it 'order by weight' do
    catch1 = create(:expedition_fish, weight: 0.5)
    catch2 = create(:expedition_fish, weight: 0.2)

    results = ExpeditionFishQuery.new({sort: 'weight'}).results
    expect(results).to eq([catch1, catch2])
  end

  it 'place filter' do
    expedition1 = create(:expedition, place_id: 1)
    expedition2 = create(:expedition, place_id: 2)
    catch1 = create(:expedition_fish, expedition: expedition1)
    catch2 = create(:expedition_fish, expedition: expedition2)

    results = ExpeditionFishQuery.new({place_id: 2}).results
    expect(results).to eq([catch2])
  end

  it 'place_type_filter' do
    place1 = create(:place, place_type: 'commercialism')
    place2 = create(:place, place_type: 'pzw')
    expedition1 = create(:expedition, place: place1)
    expedition2 = create(:expedition, place: place2)
    catch1 = create(:expedition_fish, expedition: expedition1)
    catch2 = create(:expedition_fish, expedition: expedition2)

    results = ExpeditionFishQuery.new({place_type: 'commercialism'}).results
    expect(results).to eq([catch1])
  end

  it 'fish filter' do
    fish1 = create(:fish)
    fish2 = create(:fish)
    catch1 = create(:expedition_fish, fish: fish1)
    catch2 = create(:expedition_fish, fish: fish2)

    results = ExpeditionFishQuery.new({fish_id: fish1.id}).results
    expect(results).to eq([catch1])
  end

  it 'expedition filter' do
    catch1 = create(:expedition_fish, expedition_id: 1)
    catch2 = create(:expedition_fish, expedition_id: 2)

    results = ExpeditionFishQuery.new({expedition_id: 2}).results
    expect(results).to eq([catch2])
  end
end
