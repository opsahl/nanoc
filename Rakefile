require 'stringex'

args = ARGV

def ask(prompt)
        loop do
            print prompt, ' '
            $stdout.flush
            s = gets
            exit if s == nil
            s.chomp!
        end
end

desc "Create a new post"
task :new_post, :title do |t, args|
  mkdir_p './content/posts'
  args.with_defaults(:title => 'New Post')
  title = args.title
  filename = "./content/posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"

  if File.exist?(filename)
    abort('rake aborted!') if ask("#{filename} already exists. Want to overwrite?") == 'n'
  end

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts '---'
    post.puts "title: \"#{title}\""
    post.puts "created_at: #{Time.now}"
    post.puts 'kind: article'
    post.puts 'published: false'
    post.puts "---\n\n"
  end
end
