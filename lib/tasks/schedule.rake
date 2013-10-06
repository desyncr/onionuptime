require 'net/http'
require 'socksify'
require 'socksify/http'
require 'gruff'

namespace :schedule do
  desc "Check hidden service status - Pl0x DRY THE THIS OUT OF THIS AND MAKE SUB TASKS KTHXBAI"
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

      g = Gruff::Line.new 500
      g.hide_legend = true
      g.dot_radius = 0
      g.theme = {
        :colors => ['#aedaa9', '#12a702'],
        :marker_color => 'black',
        :font_color => 'black',
        :background_colors => 'white'
      }
      g.data :response, onion.statuses.all.map{|s| s = s.delivery}
      g.write(Rails.root.join('public/' + uri.host + '-delivery.png'))

      g = Gruff::Line.new 500
      g.hide_legend = true
      g.dot_radius = 0
      g.hide_dots = true
      g.theme = {
        :colors => ['#aedaa9', '#12a702'],
        :marker_color => 'black',
        :font_color => 'black',
        :background_colors => 'white'
      }
      g.data :response, onion.statuses.all.map{|s| s = s.response}
      g.write(Rails.root.join('public/' + uri.host + '-response.png'))

    end
  end
end
