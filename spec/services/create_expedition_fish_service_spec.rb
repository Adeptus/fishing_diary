describe CreateExpeditionFishService do
  let(:expedition) { create(:expedition) }
  let(:form) { double(
    valid?: true,
    count: 100,
    fish_id: '1',
    expedition_id: expedition.id,
    length: '1',
    weight: '2',
    notes: 'asdasdas',
    user_id: '1',
    bait_id: '1'
  ) }

  it 'create 100 records' do
    service = CreateExpeditionFishService.new(expedition, form)
    expect { service.call }.to change(ExpeditionFish, :count).by(100)
  end
end