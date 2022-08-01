require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  let(:food1)   { create :menu_item, name: 'Sate', stock: 10 }
  let(:food2)   { create :menu_item, name: 'Rendang', stock: 23 }
  let(:result)  { JSON.parse(response.body) }

  describe 'GET /index' do
    context 'when the foods exists' do
      it 'returns menus' do
        food1
        food2

        get '/menus'

        expect(response.status).to eq 200
        expect(result).to match_array [{
          'id' => food1.id,
          'name' => 'Sate',
          'stock' => 10
        },{
          'id' => food2.id,
          'name' => 'Rendang',
          'stock' => 23
        }]
      end
    end

    context 'when the food does not exist' do
      it 'returns menus' do
        get '/menus'

        expect(response.status).to eq 200
        expect(result).to eq []
      end
    end
  end
end
