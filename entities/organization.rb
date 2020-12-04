class Organization < SearchableEntity
  SEARCHABLE_FIELDS = %w(_id url external_id name domain_names
    created_at details shared_tickets tags)

  JSON_FILENAME = './json/organizations.json'.freeze
end
