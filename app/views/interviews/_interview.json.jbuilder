# frozen_string_literal: true

json.extract!(interview, :id, :type, :stage, :scheduled_at, :notes, :contact_id, :company_id, :created_at, :updated_at)
json.url(interview_url(interview, format: :json))
