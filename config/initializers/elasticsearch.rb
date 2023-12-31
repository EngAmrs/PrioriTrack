config = {
  host: "http://elastic:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}

if File.exist?("config/elasticsearch.yml")
  config.merge!(YAML.load_file("config/elasticsearch.yml", aliases: true)[Rails.env].deep_symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
Searchkick.client = Elasticsearch::Client.new(config)