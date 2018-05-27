# Create a tiny RESTful Json API to index a page's content.

"Index the content" means to parse the page content and store its content - in this case to store the content that is found inside the tags h1, h2 and h3 and the links.

Although you have freedom to show your skills, the requirements below must be fulfilled:
- Your code must be written in Ruby / Ruby on Rails
- It must be 
  JsonAPI compatible. (https://jsonapi.org)
  Implemented with jsonapi_resources gem (https://github.com/cerebris/jsonapi-resources)
- The API must have at least two endpoints:
  one that receives a url and indexes the content
  one that lists previously stored urls

For endpoints:
  One endpoint should receive the URL of the page, grab its content and store its content with the tags h1, h2 and h3 and the links
  The other endpoint should list the urls and content stored in the database
  - The API must store only content
  - inside html header tags (H1, H2 and H3)
  - links urls
  - Your project must have a readmeIn sum, what one has to do is pick up the contents of the posted url, parse the  source code (html) and store the contents of h1, h2 and h3 and the links.

Within this assessment, the following skills will be assessed:
Software design
API Design and REST
Testing
Code performance and scalability
DRY
Separation of Concerns
Clarity


## Endpoints

To View complete list
GET /pages.json


To Create content
POST /pages.json params: {url: 'someurl'}