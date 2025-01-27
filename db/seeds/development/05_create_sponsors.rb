Event.all.each do |event|
  for i in event.sponsors.count..8
    sponsor_name = "Sponsor #{i} for event #{event.year}"
    sponsor  = event.sponsors.build(
      name: sponsor_name, type: "Type #{i}",
      link: "https://www.google.com/search?q=#{sponsor_name}"
    )

    filename = "sponsor-#{i % 3}.png"
    sponsor.build_logo({
      data: get_binary_data(filename),
      mime_type: get_image_mime_type(filename),
      filename: filename,
    })
    sponsor.save
  end
end
