require 'rubygems'
require 'open-uri'
require 'nokogiri'

xml = <<EOS
<parts>
  <!-- Alice's Auto Parts Store -->
  <inventory xmlns="http://alicesautoparts.com/">
    <tire>all weather</tire>
    <tire>studded</tire>
    <tire>extra wide</tire>
  </inventory>

  <!-- Bob's Bike Shop -->
  <inventory xmlns="http://bobsbikes.com/">
    <tire>street</tire>
    <tire>mountain</tire>
  </inventory>
</parts>
EOS

xml.each_line {|line|
  p line
}

@doc = Nokogiri::XML(xml)
p "@doc.xpath('//car:tire', 'car' => 'http://alicesautoparts.com/')"
car_tires = @doc.xpath('//car:tire', 'car' => 'http://alicesautoparts.com/')

car_tires.each { | car_tire |
  p car_tire.to_s
}

p "@doc.xpath('//bike:tire', 'bike' => 'http://bobsbikes.com/')"
bike_tires = @doc.xpath('//bike:tire', 'bike' => 'http://bobsbikes.com/')

bike_tires.each { | bike_tire |
  p bike_tire.to_s
}

