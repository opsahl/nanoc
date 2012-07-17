# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

module PostHelper
  def get_pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end
end

include PostHelper

def get_post_start(post)
  content = post.compiled_content
  if content =~ /\s<!-- more -->\s/
    content = content.partition('<!-- more -->').first +
    "<div class='read-more'><a class=\"btn btn-primary\" href='#{post.path}'>Continue reading &rsaquo;</a></div>"
  end
  return content
end
