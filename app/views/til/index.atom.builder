atom_feed root_url: til_root_url do |feed|
  feed.title "Today, I Learned..."
  feed.updated @things.first.updated_at

  @things.each do |thing|
    feed.entry thing, url: til_show_url(thing), id: thing.slug do |entry|
      entry.url til_show_url(thing)
      entry.title thing.title
      entry.content markdown(thing.body), type: :html
      entry.updated thing.updated_at.iso8601

      entry.author do |author|
        author.name "Justin Campbell"
        author.email "justin@justincampbell.me"
      end
    end
  end
end
