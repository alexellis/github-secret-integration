require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

post '/payload' do
  request.body.rewind
  payload_body = request.body.read
  verify_signature(payload_body)
  push = JSON.parse(params[:payload])
  "I got some JSON: #{push.inspect}"
end

def verify_signature(payload_body)
  secret_token = File.read("/run/secrets/github_webhook").strip

  signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret_token, payload_body)

  return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
end
