# frozen_string_literal: true

json.array!(@retrospectives, partial: "retrospectives/retrospective", as: :retrospective)
