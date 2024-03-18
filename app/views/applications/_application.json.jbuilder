# frozen_string_literal: true

json.extract!(
  application,
  :id,
  :url,
  :job_title,
  :notes,
  :total_comp,
  :company_tier,
  :company_id,
  :created_at,
  :updated_at,
)
json.url(application_url(application, format: :json))
