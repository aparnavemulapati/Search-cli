class Ticket < SearchableEntity
  SEARCHABLE_FIELDS = %w(_id url external_id created_at type subject
    description priority status submitter_id assignee_id organization_id
    tags has_incidents due_at via)

  JSON_FILENAME = './json/tickets.json'.freeze
end
