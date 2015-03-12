RSpec.configure do |config|
  config.before :each do
    stub_defaults = {
      request: {
        url: 'https://joe%40example.com:joesthebest@rooland.billapp.cz/invoices',
        headers: {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      }
    }

    stub_request( :get,
                  stub_defaults[:request][:url] + '.json'
    )
      .with(headers: stub_defaults[:request][:headers])
      .to_return( status:   200,
                  body:     '[{"invoice":{"account_id":7070,"client_id":57828,"created_at":"2015-03-11T14:14:12+01:00","currency":"CZK","due_date":"2015-03-21","has_vat":false,"id":96765,"issue_date":"2015-03-11","notes":"","number":"201500002","paid_on":null,"status":"draft","tax_amount":0.0,"total_amount":399.0,"updated_at":"2015-03-11T14:14:12+01:00","lines":[{"description":"Uk\u00e1zkov\u00e1 polo\u017eka\r\nTato polo\u017eka slou\u017e\u00ed pouze jako uk\u00e1zka.","item_id":11472,"quantity":1.0,"unit_price":399.0,"vat":0.0}]}},{"invoice":{"account_id":7070,"client_id":57829,"created_at":"2015-03-11T13:38:03+01:00","currency":"CZK","due_date":"2015-03-21","has_vat":false,"id":96761,"issue_date":"2015-03-11","notes":"","number":"201500001","paid_on":null,"status":"draft","tax_amount":0.0,"total_amount":689.0,"updated_at":"2015-03-11T13:38:03+01:00","lines":[{"description":"Testov\u00e1n\u00ed aplikace","item_id":null,"quantity":1.0,"unit_price":289.99,"vat":0.0},{"description":"Uk\u00e1zkov\u00e1 polo\u017eka\r\nTato polo\u017eka slou\u017e\u00ed pouze jako uk\u00e1zka.","item_id":11472,"quantity":1.0,"unit_price":399.0,"vat":0.0}]}}]',
                  headers:  {}
      )

    stub_request( :get,
                  stub_defaults[:request][:url] + '/96765.json')
      .with(headers: stub_defaults[:request][:headers])
      .to_return( status:   200,
                  body:     '{"invoice":{"account_id":7070,"client_id":57828,"created_at":"2015-03-11T14:14:12+01:00","currency":"CZK","due_date":"2015-03-21","has_vat":false,"id":96765,"issue_date":"2015-03-11","notes":"","number":"201500002","paid_on":null,"status":"draft","tax_amount":0.0,"total_amount":399.0,"updated_at":"2015-03-11T14:14:12+01:00","lines":[{"description":"Uk\u00e1zkov\u00e1 polo\u017eka\r\nTato polo\u017eka slou\u017e\u00ed pouze jako uk\u00e1zka.","item_id":11472,"quantity":1.0,"unit_price":399.0,"vat":0.0}]}}',
                  headers:  {}
      )

      )
  end
end
