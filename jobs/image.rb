SCHEDULER.every '2s' do
  send_event('picture',   { title: 'https://farm3.staticflickr.com/2948/15208892849_c9cff000cc.jpg' })
end
