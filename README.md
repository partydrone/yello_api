# Yello Books Objective
Your assignment is to implement a bookstore REST API.

## Brief
Jane, an avid reader from Chicago, has a great idea. She wants to build a
marketplace that allows her and her friends to self-publish their adventures and
sell them online to other readers. The profits would then be collected and
donated to purchase medical supplies for charity.

## Tasks
- [x] Implement assignment using:
  - [x] Language: Your choice
  - [x] Framework: Your choice
- [x] Implement a REST API returning JSON or XML based on the Content-Type header
- [x] Implement a custom user model with a "author pseudonym" field
- [x] Implement a book model. Each book should have a title, description, author
      (your custom user model), cover image and price
  - [x] Choose the data type for each field that makes the most sense
- [x] Implement REST endpoints for the /books resource
  - [x] No authentication required
  - [x] Allows only GET (List/Detail) operations
  - [x] Make the List resource searchable with query parameters
- [x] Provide REST resources for the authenticated user
  - [x] Implement the typical CRUD operations for this resource o Implement an
        endpoint to unpublish a book (DELETE)
- [x] Demonstrate all the endpoints work

## Bonus:
- [x] Provide an endpoint to authenticate with the API using username, password
      and return a JWT
- [ ] If the password is entered incorrectly for more than 5 times, the user
      should be locked out of the system for 24 hours.
- [x] Make sure the user “Anonymous” is unable to publish their work on Yello Books

## Evaluation Criteria
- Language best practices
- If you are using a framework, make sure best practices are followed for models
and configuration
- Working API endpoints
- Make sure that users may only unpublish their own books

Please organize, design, demonstrate and document your code as if it were going
into production—then push your changes to repo in Github. After you have pushed
your code, you may email us the link to your Github repo.
