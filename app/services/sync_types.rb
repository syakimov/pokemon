# frozen_string_literal: true

module SyncTypes
  module_function

  def execute
    type_params =
      Client.fetch_types.map do |type_data|
        { name: type_data.fetch('name'), idx: extract_idx_from_url(type_data.fetch('url')) }
      end

    Type.upsert_all(type_params, unique_by: :idx)
  end

  def extract_idx_from_url(url)
    url.split('/')[6]
  end
end
