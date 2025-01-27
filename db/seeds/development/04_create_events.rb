event_years = [DateTime.now.year, 2018, 2017, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008]

event_years.each_with_index do |year, i|
  next if Event.find_by(year: year)

  event = Event.new(title: "Title #{year} ", subtitle: "Subtitle #{year} ",
    year: year, overview: "Overview #{year} " * 30)

  event.build_event_info(synopsis: "Synopsis #{year}" * 50,
    description: "Description #{year}" * 100, video_link: 'www.youtube.com')

  filename = "event_logo-#{i %3}.jpg"
  event.build_logo({
    data: get_binary_data(filename),
    mime_type: get_image_mime_type(filename),
    filename: filename,
  })
  event.save
end
