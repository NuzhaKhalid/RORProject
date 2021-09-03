json.extract! project_bug, :id, :title, :status, :type, :deadline, :project_id, :created_at, :updated_at
json.url project_bug_url(project_bug, format: :json)
