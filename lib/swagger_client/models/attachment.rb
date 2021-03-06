=begin
#Bot Connector - Direct Line API - V1.0

#Direct Line  ===========      The Direct Line API is a simple REST API for connecting directly to a single bot. This API is intended for developers  writing their own client applications, web chat controls, or mobile apps that will talk to their bot.    Credentials for the Direct Line API may be obtained from the Bot Framework developer portal, and will only allow the  caller to connect to the bot for which they were generated. If you are writing a server-to-server application,  the Direct Line secret may be used directly against the API. If instead you are writing an application where a client  connects directly (and possibly insecurely) to the Direct Line API, you may exchange the secret for a token that will  work only for a single conversation and only for a limited amount of time. Tokens expire by default after 30 minutes  although they may be renewed up until their expiration.    The secret or token (depending on the authorization model) are supplied as basic auth with the \"BotConnector\" scheme  and no further encoding. Example auth header:        -- connect to directline.botframework.com --      GET /api/tokens      Authorization: BotConnector RCurR_XV9ZA.cwA.BKA.iaJrC8xpy8qbOF5xnR2vtCX7CZj0LdjAPGfiCpg4Fv0    Don't include the Ocp-Apim-Subscription-Key header. The contents of this header are your bot's secret key. The  bot's secret key is not necessary when using the Direct Line API.    Each conversation on the Direct Line channel must be explicitly started using a POST to the  https://directline.botframework.com/api/conversations endpoint.  If the call was authorized with a token, the conversation ID is the conversation ID in the scoped token. If a  secret was used to start the conversation, the conversation will be started with a new, random ID.    The client may send messages to the bot by calling POST on https://directline.botframework.com/api/conversations/{conversationId}/messages.    The client may retrieve messages sent by the bot by calling GET on https://directline.botframework.com/api/conversations/{conversationId}/messages.  The JSON structure returned contains a watermark that can be sent on subsequent requests to skip old messages.    The Direct Line API does not store messages indefinitely. Your client application must pick them up quickly before  they are deleted.    # Client libraries for the Direct Line API    * [Direct Line Nuget package](https://www.nuget.org/packages/Microsoft.Bot.Connector.DirectLine)  * Generate your own from the [Direct Line Swagger file](swagger.json)  

OpenAPI spec version: v1
Contact: botframework@microsoft.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'date'

module SwaggerClient
  # An attachment
  class Attachment
    # URL for this attachment
    attr_accessor :url

    # Content type for this attachment
    attr_accessor :content_type


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'url' => :'url',
        :'content_type' => :'contentType'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'url' => :'String',
        :'content_type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.has_key?(:'contentType')
        self.content_type = attributes[:'contentType']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          url == o.url &&
          content_type == o.content_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [url, content_type].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
