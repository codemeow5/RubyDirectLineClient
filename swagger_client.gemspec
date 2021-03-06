# -*- encoding: utf-8 -*-
#
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

$:.push File.expand_path("../lib", __FILE__)
require "swagger_client/version"

Gem::Specification.new do |s|
  s.name        = "swagger_client"
  s.version     = SwaggerClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Swagger-Codegen"]
  s.email       = ["botframework@microsoft.com"]
  s.homepage    = "https://github.com/swagger-api/swagger-codegen"
  s.summary     = "Bot Connector - Direct Line API - V1.0 Ruby Gem"
  s.description = "Direct Line  ===========      The Direct Line API is a simple REST API for connecting directly to a single bot. This API is intended for developers  writing their own client applications, web chat controls, or mobile apps that will talk to their bot.    Credentials for the Direct Line API may be obtained from the Bot Framework developer portal, and will only allow the  caller to connect to the bot for which they were generated. If you are writing a server-to-server application,  the Direct Line secret may be used directly against the API. If instead you are writing an application where a client  connects directly (and possibly insecurely) to the Direct Line API, you may exchange the secret for a token that will  work only for a single conversation and only for a limited amount of time. Tokens expire by default after 30 minutes  although they may be renewed up until their expiration.    The secret or token (depending on the authorization model) are supplied as basic auth with the \"BotConnector\" scheme  and no further encoding. Example auth header:        -- connect to directline.botframework.com --      GET /api/tokens      Authorization: BotConnector RCurR_XV9ZA.cwA.BKA.iaJrC8xpy8qbOF5xnR2vtCX7CZj0LdjAPGfiCpg4Fv0    Don't include the Ocp-Apim-Subscription-Key header. The contents of this header are your bot's secret key. The  bot's secret key is not necessary when using the Direct Line API.    Each conversation on the Direct Line channel must be explicitly started using a POST to the  https://directline.botframework.com/api/conversations endpoint.  If the call was authorized with a token, the conversation ID is the conversation ID in the scoped token. If a  secret was used to start the conversation, the conversation will be started with a new, random ID.    The client may send messages to the bot by calling POST on https://directline.botframework.com/api/conversations/{conversationId}/messages.    The client may retrieve messages sent by the bot by calling GET on https://directline.botframework.com/api/conversations/{conversationId}/messages.  The JSON structure returned contains a watermark that can be sent on subsequent requests to skip old messages.    The Direct Line API does not store messages indefinitely. Your client application must pick them up quickly before  they are deleted.    # Client libraries for the Direct Line API    * [Direct Line Nuget package](https://www.nuget.org/packages/Microsoft.Bot.Connector.DirectLine)  * Generate your own from the [Direct Line Swagger file](swagger.json)  "
  s.license     = "The MIT License (MIT)"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.3'

  s.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.1'
  s.add_development_dependency 'webmock', '~> 1.24', '>= 1.24.3'
  s.add_development_dependency 'autotest', '~> 4.4', '>= 4.4.6'
  s.add_development_dependency 'autotest-rails-pure', '~> 4.1', '>= 4.1.2'
  s.add_development_dependency 'autotest-growl', '~> 0.2', '>= 0.2.16'
  s.add_development_dependency 'autotest-fsevent', '~> 0.2', '>= 0.2.11'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
