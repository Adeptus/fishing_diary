describe ExpeditionQuery do
  it 'ability filter show public expedition and private when owner' do
    user = create(:user)
    public_expedition = create(:expedition)
    private_expedition = create(:expedition, private: true)
    user_private_expedition = create(:expedition, private: true, user: user)

    results = ExpeditionQuery.new({user_id: user.id}).results
    expect(results).to eq([public_expedition, user_private_expedition])
  end

  it 'start_at filter' do
    user = create(:user)
    public_expedition = create(:expedition)
    private_expedition = create(:expedition, private: true)
    user_private_expedition = create(:expedition, private: true, user: user)

    results = ExpeditionQuery.new({user_id: user.id}).results
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
end
