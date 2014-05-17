class LibrariesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(library_id)
    library = Library.find(library_id)
    response = Typhoeus.get("#{library.url}/libraries.json")
    # begin
    @libraries = JSON.parse(response.body)
    # rescue JSON:ParserError
    #   puts "You got a parser error"
    @libraries['libraries'].each do |l|
      if Library.find_by(url: l['url']).exists?
      else
        Library.create(url: l['url'])
      end
    end
  end
end
