# Quick instructions on running this

```bash
    git clone https://github.com/nourmat/chat-app.git
    cd chat-app
    docker compose up
```

- We need to setup local db ONLY FIRST TIME

From terminal in repo root directory
```bash
  docker exec app bundle exec bin/rails db:create
  docker exec app bundle exec bin/rails db:migrate 
  docker exec app bundle exec bin/rails db:seed
```

## Running Queues 
We have two scheduled jobs check `config/sidekiq.yml`
1. `update_chat_count` ==> `Application::UpdateChatCountJob` runs every 1 minute for testing purposes
2. `update_message_count` ==> `Chat::UpdateMessageCountJob` runs every 1 minute for testing purposes

## Other helper jobs
1. `Message::CreateJob` ==> helps in creating the message async
2. `Chat::CreateJob` ==> helps in creating the chat async

You can use this collection to interact with the system, it contains all the endpoints and examples on how to use them
[Link](https://www.postman.com/interstellar-firefly-890817/workspace/chat-app-rest-endpoints/collection/8250179-ec35d21f-03bb-4080-944d-f5b746dbbae7?action=share&creator=8250179)

* Ruby version
This uses ruby 3.2.2
