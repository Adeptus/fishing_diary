describe UpdateExpeditionFishForm do
  let(:fish_id) { '1' }
  let(:user_id) { create(:user).id }
  let(:count) { '1' }
  let(:length) { '1' }
  let(:weight) { '1' }

  let(:valid_params) {
    {
      fish_id: fish_id,
      user_id: user_id,
      length: length,
      weight: weight
    }
  }

  describe 'form validation (for creation by user)' do
    it 'valid with valid_params' do
      form = UpdateExpeditionFishForm.new(valid_params)
      expect(form.valid?).to eq true
    end

    context 'presence' do
      it 'invalid without fish_id' do
        form = UpdateExpeditionFishForm.new(valid_params.except(:fish_id))
        expect(form.valid?).to eq false
      end

      it 'invalid without length' do
        form = UpdateExpeditionFishForm.new(valid_params.except(:length))
        expect(form.valid?).to eq false
      end

      it 'invalid without weight' do
        form = UpdateExpeditionFishForm.new(valid_params.except(:weight))
        expect(form.valid?).to eq false
      end
    end
  end
end
