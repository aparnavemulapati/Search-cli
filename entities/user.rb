class User < SearchableEntity
  SEARCHABLE_FIELDS = %w(_id url external_id name alias created_at
    active verified shared locale timezone last_login_at email phone
    signature organization_id tags suspended role)

  JSON_FILENAME = './json/users.json'.freeze
end
