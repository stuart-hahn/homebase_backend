class Task < ApplicationRecord
  validates :title, presence: true

  enum status: { to_do: 'to_do', in_progress: 'in_progress', done: 'done' }
end
