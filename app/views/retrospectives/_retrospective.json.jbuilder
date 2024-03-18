# frozen_string_literal: true

json.extract!(retrospective, :id, :notes, :score, :interview_id, :application_id, :created_at, :updated_at)
json.url(retrospective_url(retrospective, format: :json))
