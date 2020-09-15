# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


USER TABLE

    username
    session_token
    pass_digest


SUB
    title
    description
    moderator_id (user association)


POST
    title 
    url (optional)
    content (optional)
    sub_id   (sub table association)
    author_id (user association)


PostSub
    post_id : int
    sub_id : id