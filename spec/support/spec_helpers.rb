module SpecHelpers
  def fixture(name)
    File.read(File.expand_path("../../fixtures/#{name}.json", __FILE__))
  end

  def stub_request!(verb, path)
    path += '?per_page=200' if verb == :get
    stub_request(verb, File.join(Barge::Client::DIGITAL_OCEAN_URL, path))
      .with(headers: request_stub_headers)
  end

  def request_stub_headers
    {
      authorization: 'Bearer some_token',
      content_type: 'application/json'
    }
  end
end
