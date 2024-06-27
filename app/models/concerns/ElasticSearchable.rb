module ElasticSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mappings do
      indexes :body, type: :text
      indexes :chat_id, type: :integer
    end

    def self.search(text, chat_id, from)
      params = {
        from: from,
        size: 10,
        query: {
          bool: {
            must: [
              {
                multi_match: {
                  query: text,
                  fields: ['body'],
                }
              },
              {
                match: {
                  chat_id: chat_id
                }
              }
            ]
          }
        }
      }

      self.__elasticsearch__.search(params).records.to_a
    end
  end
end
