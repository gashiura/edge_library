Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: ENV['ELASTICSEARCH_HOST'] || 'es:9200/',
  log: true
)
