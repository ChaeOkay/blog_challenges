helpers do

  def create_tags(tags, post)
    tags.split(', ').each { |tag| post.tags << Tag.find_or_create_by_name(tag) }
  end

end
