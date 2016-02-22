describe ExpeditionFishQuery do
  let(:fish1) { create(:fish) }
  let(:fish2) { create(:fish) }
  let(:catch1) { create(:expedition_fish, fish: fish1, expedition_id: 1, length: 10, weight: 0.5) }
  let(:catch2) { create(:expedition_fish, fish: fish2, expedition_id: 2, length: 20, weight: 0.2) }

  it 'default order(length)' do
    results = ExpeditionFishQuery.new({}).results
    expect(results).to eq([catch2, catch1])
  end

  it 'order by weight' do
    results = ExpeditionFishQuery.new({sort: 'weight'}).results
    expect(results).to eq([catch1, catch2])
  end

  it 'fish filter' do
    results = ExpeditionFishQuery.new({fish_id: fish1.id}).results
    expect(results).to eq([catch1])
  end

  it 'expedition filter' do
    results = ExpeditionFishQuery.new({expedition_id: 2}).results
    expect(results).to eq([catch2])
  end
end
