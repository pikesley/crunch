require 'flickraw'

SCHEDULER.every '5m', :first_at => Time.now do
  FlickRaw.api_key = ENV['FLICKR_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SECRET']

  send_event('picture', {image: FlickRaw.url_n(flickr.photos.getInfo(photo_id: flickr.photosets.getPhotos(photoset_id: ENV['FLICKR_ALBUM_ID'])['photo'][-1]['id']))})
end
