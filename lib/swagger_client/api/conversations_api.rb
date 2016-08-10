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

require "uri"

module SwaggerClient
  class ConversationsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Get messages in this conversation. This method is paged with the 'watermark' parameter.
    # 
    # @param conversation_id Conversation ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :watermark (Optional) only returns messages newer than this watermark
    # @return [MessageSet]
    def conversations_get_messages(conversation_id, opts = {})
      data, _status_code, _headers = conversations_get_messages_with_http_info(conversation_id, opts)
      return data
    end

    # Get messages in this conversation. This method is paged with the &#39;watermark&#39; parameter.
    # 
    # @param conversation_id Conversation ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :watermark (Optional) only returns messages newer than this watermark
    # @return [Array<(MessageSet, Fixnum, Hash)>] MessageSet data, response status code and response headers
    def conversations_get_messages_with_http_info(conversation_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ConversationsApi.conversations_get_messages ..."
      end
      # verify the required parameter 'conversation_id' is set
      fail ArgumentError, "Missing the required parameter 'conversation_id' when calling ConversationsApi.conversations_get_messages" if conversation_id.nil?
      # resource path
      local_var_path = "/api/conversations/{conversationId}/messages".sub('{format}','json').sub('{' + 'conversationId' + '}', conversation_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'watermark'] = opts[:'watermark'] if !opts[:'watermark'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/json', 'text/html', 'application/xml', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'MessageSet')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConversationsApi#conversations_get_messages\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start a new conversation
    # 
    # @param [Hash] opts the optional parameters
    # @return [Conversation]
    def conversations_new_conversation(opts = {})
      data, _status_code, _headers = conversations_new_conversation_with_http_info(opts)
      return data
    end

    # Start a new conversation
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Conversation, Fixnum, Hash)>] Conversation data, response status code and response headers
    def conversations_new_conversation_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ConversationsApi.conversations_new_conversation ..."
      end
      # resource path
      local_var_path = "/api/conversations".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/json', 'text/html', 'application/xml', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Conversation')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConversationsApi#conversations_new_conversation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Send a message
    # 
    # @param conversation_id Conversation ID
    # @param message Message to send
    # @param [Hash] opts the optional parameters
    # @return [ErrorMessage]
    def conversations_post_message(conversation_id, message, opts = {})
      data, _status_code, _headers = conversations_post_message_with_http_info(conversation_id, message, opts)
      return data
    end

    # Send a message
    # 
    # @param conversation_id Conversation ID
    # @param message Message to send
    # @param [Hash] opts the optional parameters
    # @return [Array<(ErrorMessage, Fixnum, Hash)>] ErrorMessage data, response status code and response headers
    def conversations_post_message_with_http_info(conversation_id, message, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ConversationsApi.conversations_post_message ..."
      end
      # verify the required parameter 'conversation_id' is set
      fail ArgumentError, "Missing the required parameter 'conversation_id' when calling ConversationsApi.conversations_post_message" if conversation_id.nil?
      # verify the required parameter 'message' is set
      fail ArgumentError, "Missing the required parameter 'message' when calling ConversationsApi.conversations_post_message" if message.nil?
      # resource path
      local_var_path = "/api/conversations/{conversationId}/messages".sub('{format}','json').sub('{' + 'conversationId' + '}', conversation_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = []
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json', 'text/json', 'text/html', 'application/xml', 'text/xml', 'application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(message)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ErrorMessage')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConversationsApi#conversations_post_message\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Upload file(s) and send as attachment(s)
    # 
    # @param conversation_id 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def conversations_upload(conversation_id, opts = {})
      conversations_upload_with_http_info(conversation_id, opts)
      return nil
    end

    # Upload file(s) and send as attachment(s)
    # 
    # @param conversation_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def conversations_upload_with_http_info(conversation_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ConversationsApi.conversations_upload ..."
      end
      # verify the required parameter 'conversation_id' is set
      fail ArgumentError, "Missing the required parameter 'conversation_id' when calling ConversationsApi.conversations_upload" if conversation_id.nil?
      # resource path
      local_var_path = "/api/conversations/{conversationId}/upload".sub('{format}','json').sub('{' + 'conversationId' + '}', conversation_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = []
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConversationsApi#conversations_upload\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end