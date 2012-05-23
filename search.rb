require 'rubygems'
require 'open-uri'
require 'nokogiri'

xml = <<EOS
<root>
  <sitcoms>
    <sitcom>
      <name>Married with Children</name>
      <characters>
        <character>Al Bundy</character>
        <character>Bud Bundy</character>
        <character>Marcy Darcy</character>
      </characters>
    </sitcom>
    <sitcom>
      <name>Perfect Strangers</name>
      <characters>
        <character>Larry Appleton</character>
        <character>Balki Bartokomous</character>
      </characters>
    </sitcom>
  </sitcoms>
  <dramas>
    <drama>
      <name>The A-Team</name>
      <characters>
        <character>John "Hannibal" Smith</character>
        <character>Templeton "Face" Peck</character>
        <character>"B.A." Baracus</character>
        <character>"Howling Mad" Murdock</character>
      </characters>
    </drama>
  </dramas>
</root>
EOS

xml.each_line {|line|
  p line
}

@doc = Nokogiri::XML(xml)

p "character"
characters = @doc.xpath("//character")
p characters[0].to_s() # => "<character>Al Bundy</character>"

characters.each{|chara|
  p chara.to_s()
}

p "//dramas//character"
characters = @doc.xpath("//dramas//character")
characters.each{|chara|
  p chara.to_s()
}

p "@doc.css(\"sitcoms name\")"
characters = @doc.css("sitcoms name")
characters.each{|chara|
  p chara.to_s()
}

p "@doc.css(\"dramas name\").first"
p @doc.css("dramas name").first.to_s # => "<name>The A-Team</name>"
p "@doc.at_css(\"dramas name\")"
p @doc.at_css("dramas name").to_s    # => "<name>The A-Team</name>"

p "@doc.css(\"sitcoms name\")"
characters = @doc.css("sitcoms name")
p characters[0].to_s
p characters[1].to_s
p characters[2].to_s



