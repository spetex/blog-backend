# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :articles do
      primary_key :id
      String :name
    end
  end
end
