require 'net/http'
require 'socksify'
require 'socksify/http'

namespace :schedule do
  desc "Check hidden service status"
  task check: :environment do
    Onion.all.each do |onion|
      uri       = URI.parse(onion.url)
      start     = Time.now
      ping      = 0
      delivery  = 0
      status    = 0

      Socksify::debug = true

      TCPSocket::socks_server = "127.0.0.1"
      TCPSocket::socks_port = 9050
      begin
        TCPSocket.new(uri.host, 80)
        ping = Time.now - start

        Net::HTTP.SOCKSProxy('127.0.0.1', 9050).start(uri.host, uri.port) do |http|
          http.get(uri.path.empty? ? '/' : uri.path)
          status = 200
          delivery = Time.now - start
        end

      rescue Exception => e
        puts e.message
      end

      update = onion.statuses.new(:status => status, :response => ping, :delivery => delivery, :date => Time.now)
      update.save!
    end
  end
end
