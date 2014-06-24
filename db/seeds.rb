ActiveRecord::SessionStore::Session.create!([
  {session_id: "38239f01cdc404159eb190cc05eb7ded", data: "BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFFam5KSDc1YTYyOWw0cktFZzY4\nRU9mZ1JrdkNTazJXaWd2WUs5Q0poYjRzPQY7AEY=\n"},
  {session_id: "15b52fbddcf545e0584df9afb0baa2d8", data: "BAh7CEkiCmZsYXNoBjoGRVR7B0kiDGRpc2NhcmQGOwBUWwBJIgxmbGFzaGVz\nBjsAVHsGOgtub3RpY2VJIiZQcm9kdWN0IHdhcyBzdWNjZXNzZnVsbHkgdXBk\nYXRlZC4GOwBUSSIZd2FyZGVuLnVzZXIudXNlci5rZXkGOwBUWwdbBmkGSSIi\nJDJhJDEwJHlaRlJXVWY2VnBLOTZtUHJvOFViOS4GOwBUSSIQX2NzcmZfdG9r\nZW4GOwBGSSIxU29FQ1Niamp0dzRHcFVzUi9LVVJYcGh3T3h4WUN3ODlOaUs1\nUUM1Z0plND0GOwBG\n"}
])
ActsAsVotable::Vote.create!([
  {votable_id: 1, votable_type: "Product", voter_id: 1, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_id: 3, votable_type: "Product", voter_id: 1, voter_type: "User", vote_flag: false, vote_scope: nil, vote_weight: 1},
  {votable_id: 5, votable_type: "Product", voter_id: 1, voter_type: "User", vote_flag: false, vote_scope: nil, vote_weight: 1},
  {votable_id: 4, votable_type: "Product", voter_id: 1, voter_type: "User", vote_flag: false, vote_scope: nil, vote_weight: 1},
  {votable_id: 1, votable_type: "Product", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_id: 3, votable_type: "Product", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_id: 7, votable_type: "Product", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_id: 4, votable_type: "Product", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_id: 6, votable_type: "Product", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_id: 2, votable_type: "Product", voter_id: 2, voter_type: "User", vote_flag: true, vote_scope: nil, vote_weight: 1}
])
User.create!([
  {email: "a@b.c", encrypted_password: "$2a$10$yZFRWUf6VpK96mPro8Ub9.rdr1PCQPLcNvU4yEfB0xWq0zjow49My", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2014-05-15 22:51:45", last_sign_in_at: "2014-05-15 20:34:49", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "a", last_name: "b", avatar: nil, is_closed: nil, is_admin: true, address: "nr abc mall"},
  {email: "d@e.c", encrypted_password: "$2a$10$PeKCxjfAQk52itY51GyNxOlmL17T9g0oUM.tDbUltDANMA565WGYu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-05-15 21:10:10", last_sign_in_at: "2014-05-15 21:10:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "d", last_name: "e", avatar: nil, is_closed: nil, is_admin: nil, address: "nr abc mall"}
])
Category.create!([
  {name: "APPLIANCES"},
  {name: "BATH"},
  {name: "BUILDING MATERIALS"},
  {name: "DOORS & WINDOWS"},
  {name: "ELECTRICAL"},
  {name: "FLOORING"},
  {name: "FURNITURE"},
  {name: "HEAVY EQUIPMENT"},
  {name: "INTERIOR DECOR"},
  {name: "KITCHEN"},
  {name: "LIGHTING & FANS"},
  {name: "OUTDOOR & LAWN"},
  {name: "PAINT"},
  {name: "PLUMBING"},
  {name: "STORAGE"},
  {name: "TOOLS & HARDWARE"}
])
Product.create!([
  {name: "Egypt by tinou bao", image: "2065246941_e51172f8b5_b.jpg", link: "http://thewall.sofarider.com/news/egypt-by-tinou-bao/", desc: "I've been looking for some cool images at Flickr and suddenly came across this one. All I can say is WOW!", slug: "1-egypt-by-tinou-bao", price: 0.0},
  {name: "My car at Flickr", image: "6420017999_eb5448ee3e_b.jpg", link: "http://thewall.sofarider.com/news/my-car-at-flickr/", desc: "Not quite mine but hopefully it's gonna be mine one day. I will accept donations from all the good people, God bless you!", slug: "2-my-car-at-flickr", price: 0.0},
  {name: "Lincoln – official trailer", image: "102706941_897645fc02_b.jpg", link: "http://thewall.sofarider.com/news/lincoln-official-trailer/", desc: "Suspendisse lacinia eros ut magna iaculis ac pulvinar nulla tincidunt. Vestibulum ante enim, malesuada vel imperdiet sed, posuere non elit.", slug: "3-lincoln--official-trailer", price: 0.0},
  {name: "From the Blip.TV", image: "1714127310_bd8df32bd3_b.jpg", link: "http://thewall.sofarider.com/news/from-the-blip-tv/", desc: "Sed cursus mi vitae nulla aliquet ac feugiat libero volutpat. Maecenas in enim ante, ut lobortis turpis. Donec nec justo mauris, et egestas ante.", slug: "4-from-the-bliptv", price: 0.0},
  {name: "Rolands lakis at Flickr", image: "3710498218_22e62d11b2_o-650x400.jpg", link: "http://thewall.sofarider.com/news/secret-code-of-davinci/", desc: "Mauris blandit elementum augue eget egestas. Praesent sem metus, bibendum ac mattis ut, pellentesque at enim. Phasellus non dolor nec urna auctor congue et vel odio.", slug: "5-rolands-lakis-at-flickr", price: 0.0},
  {name: "Pears – patterns of makeup and style", image: "5318048862_108c0667ee_b-599x400.jpg", link: "http://thewall.sofarider.com/news/malesunda-nanoot/", desc: "Nam lorem dolor, imperdiet ac laoreet in, dignissim eu felis. Vestibulum auctor felis non justo tempor ut commodo elit ultricies.", slug: "6-pears--patterns-of-makeup-and-style", price: 0.0},
  {name: "Multiple Paragraph Post", image: "1471984989_957c7f7093_b-560x400.jpg", link: "http://thewall.sofarider.com/news/multiple-paragraph-post/", desc: "Aliquam erat volutpat. Nam quis lacus turpis, non blandit tellus. Nam pellentesque nibh ut ante lobortis nec rutrum est fringilla. Vivamus nec purus in purus pharetra posuere.", slug: "7-multiple-paragraph-post", price: 0.0}
])
ProductCategory.create!([
  {product_id: 1, category_id: 1},
  {product_id: 2, category_id: 2},
  {product_id: 3, category_id: 3},
  {product_id: 4, category_id: 4},
  {product_id: 5, category_id: 5},
  {product_id: 6, category_id: 6},
  {product_id: 7, category_id: 8}
])
