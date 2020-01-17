class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # Rubyのリテラル表記と呼ばれるものです。
  # ["日", "月", "火", "水", "木", "金", "土"]の配列と同じように使えます。
  $days_of_the_week = %w{日 月 火 水 木 金 土}
end
