class Bug < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: {in: ['new', 'started', 'completed']}
  validates :bug_type, inclusion: { in: ['feature', 'bug']}
  STATUS_OPTIONS = [['New', 'new'],
                    ['Started', 'started'],
                    ['Completed', 'completed']]

  TYPE_OPTIONS = [['Feature', 'feature'],
                  ['Bug', 'bug']]
end
