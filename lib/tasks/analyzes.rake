def colorize(code, text)
  "\e[#{code}m#{text}\e[0m"
end

def log(text, code = :info)
  case code
  when :info
    puts colorize(36, text)
  when :ok
    puts colorize(32, text)
  when :warn
    puts colorize(33, text)
  when :error
    puts colorize(31, text)
  end
end

def info

  log "\n|--------------------------------|", :ok
  log "|          WELCOME TO KGB        |", :ok
  log "|          Secure System         |", :ok
  log "|--------------------------------|\n\n", :ok

  log "Enabling satellites..."
  sleep 0.5
  log "Done. \n", :ok

  log "Installing CIA Plug-in.."
  sleep 0.3
  log "Done. \n", :ok

  log "Accessing secure networking tunnel.."
  sleep 0.75
  log "Done. \n", :ok

  log "\n..................................\n", :warn
end

def ip
  Array.new(4) { rand(256) }.join('.')
end

desc 'Analyzes the first five pages'
task analyzes: :environment do
  info

  log "Target acquired: McKaig Chevrolet Buick - A Dealer For The People ", :warn

  log "Getting reviews... "
  get_scrape_reviews_service = Services::ScrapeReviews.new
  reviews = get_scrape_reviews_service.call
  log "Done. Found #{reviews.size} reviews \n", :ok

  log "Initializing analyzes and calculating score... "
  rate_reviews_service = Services::RateReviews.new
  top3 = rate_reviews_service.get_top_reviews(reviews)

  log "TOP 3 REVIEWS:\n"

  get_scrape_reviews_service.show_ranking(top3)

  log "Done.\n", :ok

  log "\n..................................\n", :warn
end