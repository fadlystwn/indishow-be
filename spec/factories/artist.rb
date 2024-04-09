FactoryBot.define do
  factory :artist do
    name { "Nirvana" }
    genre { "Grunge" }
    bio { "Nirvana was an American rock band formed in 1987 in Aberdeen, Washington. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through a succession of drummers before recruiting Dave Grohl in 1990. Nirvana's success popularized alternative rock, and they were often referenced as the figurehead band of Generation X." }
  end

  factory :artist02, class: Artist do
    name { "The Beatles" }
    genre { "Rock" }
    bio { "The Beatles were an English rock band formed in Liverpool in 1960. With a line-up comprising John Lennon, Paul McCartney, George Harrison and Ringo Starr, they are regarded as the most influential band of all time." }
  end
end
