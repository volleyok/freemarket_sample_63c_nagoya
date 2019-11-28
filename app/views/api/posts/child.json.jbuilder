json.array! @child_categories do |category|
  json.id category.id
  json.name category.name
  json.ancestry category.ancestry
end
