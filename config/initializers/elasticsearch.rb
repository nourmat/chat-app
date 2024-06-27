require 'elasticsearch'

Elasticsearch::Model.client = Elasticsearch::Client.new(url: 'elasticsearch:9200')
# client.ping
# client.search(q: 'test')
