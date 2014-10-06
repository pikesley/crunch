require 'flickraw'

SCHEDULER.every '5m', :first_at => Time.now do
  FlickRaw.api_key = ENV['FLICKR_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SECRET']

  f = flickr.photos.getInfo(photo_id: flickr.photosets.getPhotos(photoset_id: ENV['FLICKR_ALBUM_ID'])['photo'].sample['id'])
  send_event('picture', {
    image: FlickRaw.url(f),
    link: f['urls'][0],
    date: Crunch.date_fixer(f['dates']['taken']),
    interval: Crunch.time_since(f['dates']['taken'])
    } )
end
