class AdventuresWorker
  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  # sidekiq_options retry: false
  
  # goes to each library and gets the adventures inside of it.
  def perform(library_id)
    library = Library.find(library_id)
    response = Typhoeus.get("#{library.url}/adventures.json")
    @adventures = JSON.parse(response.body)
    @adventures['adventures'].each do |adv|
      if !Adventure.find_by(guid: adv['guid'])
        library.adventures.create(title: adv['title'], author: adv['author'], guid: adv['guid'], pages_attributes => adv[:pages])
      end
    end  
  end
end