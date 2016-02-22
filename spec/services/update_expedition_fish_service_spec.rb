describe UpdateExpeditionFishService do
  it 'update expedition_fish' do
    expedition = create(:expedition)
    expedition_fish = create(:expedition_fish, expedition: expedition, length: '20')
    form = double(
      valid?: true,
      fish_id: 1,
      method_id: '',
      attributes: {
        length: '25'
      }
    )

    service = UpdateExpeditionFishService.new(expedition_fish, form)
    expect{ service.call }.to change(expedition_fish, :length)
  end
end
