[1mdiff --git a/app/assets/stylesheets/application.scss b/app/assets/stylesheets/application.scss[m
[1mindex b3e389f..2d79da9 100644[m
[1m--- a/app/assets/stylesheets/application.scss[m
[1m+++ b/app/assets/stylesheets/application.scss[m
[36m@@ -1 +1,4 @@[m
[31m-@import 'home';[m
\ No newline at end of file[m
[32m+[m[32m@import url(https://fonts.googleapis.com/css?family=Montserrat);[m
[32m+[m
[32m+[m
[32m+[m[32m@import 'home';[m
[1mdiff --git a/app/assets/stylesheets/home.scss b/app/assets/stylesheets/home.scss[m
[1mindex ce977c3..7050ef0 100644[m
[1m--- a/app/assets/stylesheets/home.scss[m
[1m+++ b/app/assets/stylesheets/home.scss[m
[36m@@ -1,10 +1,13 @@[m
[32m+[m[32m$font:  'Montserrat', sans-serif;[m
[32m+[m
[32m+[m
 .menu {[m
   padding-top: 10px;[m
 [m
   .profile {[m
     margin-bottom: 20px;[m
 [m
[31m-    img {[m
[32m+[m[32m    img.wiggley {[m
       max-width: 70%;[m
       display: block;[m
       margin: auto;[m
[36m@@ -13,6 +16,7 @@[m
       box-shadow: 0 5px 10px rgba(0,0,0,0.3);[m
       transition: all 0.2s ease;[m
 [m
[32m+[m
       &:hover {[m
         transform: rotate(3deg);[m
       }[m
[36m@@ -22,9 +26,11 @@[m
       text-align: center;[m
       font-size: 25px;[m
       font-weight: normal;[m
[32m+[m[32m      font-family: $font;[m
[32m+[m[32m      text-transform: uppercase;[m
 [m
       a {[m
[31m-        color: black;[m
[32m+[m[32m        color: #484848;[m
         &:hover {[m
           text-decoration: none;[m
         }[m
[36m@@ -34,6 +40,8 @@[m
     .bio {[m
       color: #999;[m
       text-align: center;[m
[32m+[m[32m      text-transform: uppercase;[m
[32m+[m[32m      font-family: $font;[m
     }[m
   }[m
 [m
[36m@@ -49,7 +57,9 @@[m
     }[m
 [m
     a {[m
[31m-      color: black;[m
[32m+[m[32m      color: #484848;[m
[32m+[m[32m      text-transform: uppercase;[m
[32m+[m[32m      font-family: $font;[m
 [m
       &:hover {[m
         text-decoration: underline;[m
[36m@@ -59,12 +69,16 @@[m
 }[m
 [m
 h2 {[m
[32m+[m[32m  font-family: $font;[m
[32m+[m[32m  color: #484848;[m
[32m+[m[32m  font-size: 18px;[m
[32m+[m[32m  text-transform: uppercase;[m
   a {[m
[31m-    color: black;[m
[32m+[m[32m    color: #484848;[m
 [m
     &:hover {[m
       text-decoration: underline;[m
[31m-      color: black;[m
[32m+[m[32m      color: #ff9bd6;[m
     }[m
   }[m
 }[m
[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex 7f87e22..06e324b 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -1,5 +1,5 @@[m
 <%= render 'section', title: 'News', photos: @photos.tagged('lillypirinews') %>[m
[31m-<%= render 'section', title: 'Daily Painting Project', photos: @photos.tagged('lillypiripaints') %>[m
[32m+[m[32m<%= render 'section', title: 'Daily Painting Projects', photos: @photos.tagged('lillypiripaints') %>[m
 <%= render 'section', title: 'Still Life', photos: @photos.tagged('lillypiristilllife') %>[m
 [m
 <h2><a href="https://lillypiri.etsy.com">Shop</a></h2>[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex 99303c4..1cfecfa 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -2,8 +2,8 @@[m
 <html>[m
 <head>[m
   <title>Lilly Piri</title>[m
[31m-  <%= stylesheet_link_tag    'application', media: 'all' %>[m
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">[m
[32m+[m[32m  <%= stylesheet_link_tag    'application', media: 'all' %>[m
   <%= javascript_include_tag 'application' %>[m
   <%= csrf_meta_tags %>[m
   <meta content='width=device-width, minimum-scale=1.0, maximum-scale=1.0' name='viewport' />[m
[36m@@ -16,20 +16,24 @@[m
                     <div class="profile">[m
                         <h1>[m
                             <%= link_to root_path do %>[m
[31m-                                <%= image_tag 'profile.jpg', class: 'img-responsive' %>[m
[31m-                                Lilly Piri[m
[32m+[m[32m                                <%= image_tag 'profile.jpg', class: 'img-responsive wiggley' %>[m
[32m+[m[32m                                <%= image_tag 'lillypiri.png', alt: 'Lilly Piri' %>[m
                             <% end %>[m
                         </h1>[m
                         <div class="bio">[m
[31m-                            Lilly Piri is an artist based on the Gold Coast, Australia[m
[32m+[m[32m                            Artist x illustrator 🎨<br/>[m
[32m+[m[32m                            Gold Coast, Oz 🐨<br/>[m
[32m+[m[32m                            Write to: lilly@lillypiri.com<br/><br/>[m
[32m+[m[32m                            Illustration enquiries: info@jackywinter.com<br/>[m
                         </div>[m
                     </div>[m
 [m
                     <div class="links">[m
                         <ul>[m
[31m-                            <li><%= link_to 'Etsy', 'https://www.etsy.com/au/shop/lillypiri' %></li>[m
[31m-                            <li><%= link_to 'eBay', 'http://www.ebay.com.au/sch/theshakinbrave/m.html' %></li>[m
[32m+[m[32m                            <li><%= link_to 'Shop', 'https://www.etsy.com/au/shop/lillypiri' %></li>[m
[32m+[m[32m                            <li><%= link_to 'Illustrations', 'http://jackywinter.com/artists/lilly-piri' %></li>[m
                             <li><%= link_to 'Instagram', 'https://instagram.com/lillypiri' %></li>[m
[32m+[m[32m                            <li><%= link_to 'Twitter', 'https://twitter.com/lillypiri' %></li>[m
                             <li><%= link_to 'Patreon', 'https://www.patreon.com/lillypiri' %></li>[m
                         </ul>[m
                     </div>[m
