# app/models/dictionary.rb

class Dictionary
  include HTTParty

  base_uri 'https://api.dictionaryapi.dev'

  def fetch_definition(word)
    response = self.class.get("/api/v2/entries/en/#{word}")
    handle_response(response)
  end

  private

  # def handle_response(response)
  #   if response.success?
  #     response_hash = JSON.parse(response.body)

  #     definitions_by_parts_of_speech = Hash.new { |hash, key| hash[key] = [] }

  #     response_hash[0]["meanings"].each do |meaning|
  #       part_of_speech = meaning['partOfSpeech']
  #       definitions_by_parts_of_speech[part_of_speech].concat(meaning['definitions'])
  #     end

  #     return definitions_by_parts_of_speech
  #   else
  #     nil
  #   end

  def handle_response(response)
    if response.success?
      response_hash = JSON.parse(response.body)

      definitions_by_parts_of_speech = Hash.new { |hash, key| hash[key] = [] }

      response_hash[0]["meanings"].each do |meaning|
        part_of_speech = meaning['partOfSpeech']
        definitions_by_parts_of_speech[part_of_speech].concat(meaning['definitions'].map { |def_hash| def_hash['definition'] })
      end

      return definitions_by_parts_of_speech
    else
      nil
    end

  end
end
