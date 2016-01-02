describe ExpeditionFishForm do
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
      weight: weight,
      count: count
    }
  }

  describe 'form validation (for creation by user)' do
    it 'valid with valid_params' do
      form = ExpeditionFishForm.new(valid_params)
      expect(form.valid?).to eq true
    end

    context 'presence' do
      it 'invalid without count' do
        form = ExpeditionFishForm.new(valid_params.except(:count))
        expect(form.valid?).to eq false
      end

      it 'invalid without fish_id' do
        form = ExpeditionFishForm.new(valid_params.except(:fish_id))
        expect(form.valid?).to eq false
      end

      it 'invalid without length' do
        form = ExpeditionFishForm.new(valid_params.except(:length))
        expect(form.valid?).to eq false
      end

      it 'invalid without weight' do
        form = ExpeditionFishForm.new(valid_params.except(:weight))
        expect(form.valid?).to eq false
      end
    end

    context 'length format' do
      it 'valid when nuber' do
        form = ExpeditionFishForm.new(valid_params.merge(length: '111'))
        expect(form.valid?).to eq true
      end

      it 'valid with range' do
        form = ExpeditionFishForm.new(valid_params.merge(length: '111-123'))
        expect(form.valid?).to eq true
      end

      it 'invalid with letters' do
        form = ExpeditionFishForm.new(valid_params.merge(length: 'aa'))
        expect(form.valid?).to eq false
      end

      it 'invalid with too big number' do
        form = ExpeditionFishForm.new(valid_params.merge(length: '1111'))
        expect(form.valid?).to eq false
      end

      it 'invalid with too big range' do
        form = ExpeditionFishForm.new(valid_params.merge(length: '111-1111'))
        expect(form.valid?).to eq false
      end
    end

    context 'weight format' do
      it 'valid when nuber' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '11'))
        expect(form.valid?).to eq true
      end

      it 'valid with range' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '11-12'))
        expect(form.valid?).to eq true
      end

      it 'valid with foalt' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '1,1'))
        expect(form.valid?).to eq true
      end

      it 'valid with foalt range' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '1,11-2,11'))
        expect(form.valid?).to eq true
      end

      it 'invalid with letters' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: 'aa'))
        expect(form.valid?).to eq false
      end

      it 'invalid with too big number' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '111'))
        expect(form.valid?).to eq false
      end

      it 'invalid with too big range' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '11-111'))
        expect(form.valid?).to eq false
      end

      it 'invalid with empty float' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '1,'))
        expect(form.valid?).to eq false
      end

      it 'invalid with empty range' do
        form = ExpeditionFishForm.new(valid_params.merge(weight: '1-'))
        expect(form.valid?).to eq false
      end
    end

    it 'invalid when count not number' do
      form = ExpeditionFishForm.new(valid_params.merge(count: 'a'))
      expect(form.valid?).to eq false
    end

    it 'invalid when count lower or equal 0' do
      form = ExpeditionFishForm.new(valid_params.merge(count: 0))
      expect(form.valid?).to eq false
    end
  end
end