# README

## Models

  * User
    name: string [unique, 4-12 chars, present]
    security information (devise)
    created_event_id: integer
    
    has_many: events, through: attended_events
    has_many: created_events("Event")

  * Event
    name: string [present]
    info: text [present]
    date: datetime [present]
    location: string [present]
    creator_id: integer

    belongs_to: creator("User")
    has_many: guests, through: attended_events, source: user

  * User_Event
    user_id: integer
    part_id: integer
