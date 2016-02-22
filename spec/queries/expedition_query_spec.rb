describe ExpeditionQuery do
  it 'ability filter show public expedition and private when owner' do
    user = create(:user)
    public_expedition = create(:expedition)
    private_expedition = create(:expedition, private: true)
    user_private_expedition = create(:expedition, private: true, user: user)

    results = ExpeditionQuery.new({current_user_id: user.id}).results
    expect(results).to eq([public_expedition, user_private_expedition])
  end

  context 'start_at_filter' do
    it 'only start from' do
      today = create(:expedition, start_at: Time.now)
      yesterday = create(:expedition, start_at: Time.now - 1.days)
      long_time_ago = create(:expedition, start_at: Time.now - 3.days)

      results = ExpeditionQuery.new({start_at_from: Time.now - 2.days}).results
      expect(results).to eq([today, yesterday])
    end

    it 'btween' do
      today = create(:expedition, start_at: Time.now)
      yesterday = create(:expedition, start_at: Time.now - 1.days)
      long_time_ago = create(:expedition, start_at: Time.now - 3.days)

      results = ExpeditionQuery.new({
        start_at_from: Time.now - 2.days,
        start_at_to: Time.now - 1.days
      }).results
      expect(results).to eq([yesterday])
    end

    it 'only start to' do
      today = create(:expedition, start_at: Time.now)
      yesterday = create(:expedition, start_at: Time.now - 1.days)
      long_time_ago = create(:expedition, start_at: Time.now - 3.days)

      results = ExpeditionQuery.new({start_at_to: Time.now - 2.days}).results
      expect(results).to eq([long_time_ago])
    end
  end

  it 'place filter' do
    place = create(:place)
    place2 = create(:place)
    expedition = create(:expedition, place: place2)
    place_expedition = create(:expedition, place: place)

    results = ExpeditionQuery.new({ place_id: place.id }).results
    expect(results).to eq([place_expedition])
  end

  it 'user filter' do
    user = create(:user)
    user2 = create(:user)
    expedition = create(:expedition, user: user2)
    user_expedition = create(:expedition, user: user)

    results = ExpeditionQuery.new({ user_id: user.id }).results
    expect(results).to eq([user_expedition])
  end

  it 'fish filter' do
    fish1 = create(:fish, name: 'Leszcz')
    fish2 = create(:fish, name: 'Płoć')
    fish3 = create(:fish, name: 'Szczupak')
    expedition1 = create(:expedition)
    expedition2 = create(:expedition)
    expedition3 = create(:expedition)
    create(:catch_cache, catchable: expedition1, fish_id: fish1.id)
    create(:catch_cache, catchable: expedition2, fish_id: fish2.id)
    create(:catch_cache, catchable: expedition3, fish_id: fish3.id)

    results = ExpeditionQuery.new({ fish_ids: ['', fish1.id, fish2.id] }).results
    expect(results).to eq([expedition1, expedition2])
  end

  it 'method filter' do
    method1 = create(:catch_method)
    method2 = create(:catch_method)
    method3 = create(:catch_method)
    expedition1 = create(:expedition)
    expedition2 = create(:expedition)
    expedition3 = create(:expedition)
    create(:catch_cache, catchable: expedition1, method_id: method1.id)
    create(:catch_cache, catchable: expedition2, method_id: method2.id)
    create(:catch_cache, catchable: expedition3, method_id: method3.id)

    results = ExpeditionQuery.new({ method_ids: ['', method1.id, method2.id] }).results
    expect(results).to eq([expedition1, expedition2])
  end
end
