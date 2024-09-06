class Task < ApplicationRecord
  validates :title, presence: true

  # Enum for status
  enum status: { to_do: 'to_do', in_progress: 'in_progress', done: 'done' }

  # Enum for priority
  enum priority: { low: 'low', medium: 'medium', high: 'high' }
end
