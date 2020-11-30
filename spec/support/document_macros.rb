# frozen_string_literal: true

module DocumentMacros
  def load_json_from(path)
    JSON.parse(File.read(path), symbolize_names: true)
  end
end
