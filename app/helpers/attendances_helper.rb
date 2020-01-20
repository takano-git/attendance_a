module AttendancesHelper

  # 出社時間と退社時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f",((finish- start) / 60) / 60.0)
  end
end