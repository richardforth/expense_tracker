require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  RSpec.describe API do
    include Rack::Test::Methods
    let(:ledger) { instance_double('ExpenseTracker::Ledger') }
    let(:app) { API.new(ledger: ledger) }

    describe 'POST /expenses' do
      context 'when the expense is successfully recorded' do
        # ... specs go here ...

        it 'responds with a 200 (OK)' do
          expense = { 'some' => 'data' }

          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(true, 417, nil))

          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(200)
        end

        it 'returns the expense id'
      end

      context 'when the expense fails validation' do
        # ... specs go here ...
        it 'responds with a 422 (Unprocessable entity)'
        it 'returns an error message'
      end
    end
  end
end