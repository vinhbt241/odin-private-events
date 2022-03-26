# README

## Models

  * User
    name: string [unique, 4-12 chars, present]
    security information (devise)
    
    has_and_belongs_to_many: events

  * Event
    name: string [present]
    info: text [present]
    date: datetime [present]
    location: string [present]

    has_and_belongs_to_many: users

  * User_Event
    user_id: integer
    part_id: integer
