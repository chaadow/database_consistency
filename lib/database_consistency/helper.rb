module DatabaseConsistency
  # The module contains helper methods
  module Helper
    module_function

    # Returns list of models to check
    def models
      ActiveRecord::Base.descendants.select { |model| model.validators.any? }
    end

    # Loads all models
    def load_environment!
      Rails.application.eager_load! if defined?(Rails)
    end

    # Find a database field with name equals to attribute
    def find_field(model, attribute)
      model.columns.select.find { |field| field.name == attribute }
    end
  end
end
