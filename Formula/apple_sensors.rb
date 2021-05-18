class AppleSensors < Formula
  desc "Apple Sensors to influx"
  homepage "https://github.com/gjasny/apple_sensors"
  url "https://github.com/gjasny/apple_sensors.git",
      tag:      "0.2.0",
      revision: "5138bb295306435ca37c7419049b165514b074a8"
  license "BSD-3-Clause"
  head "https://github.com/gjasny/apple_sensors.git"

  def install
    system "make"
    bin.install "temp_sensor"
  end

  test do
    system "#{bin}/temp_sensor"
  end
end
