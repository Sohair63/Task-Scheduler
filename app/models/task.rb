class Task < ActiveRecord::Base
  include AASM

  attr_accessible :name, :executable_path, :start_time, :end_time, :status

  validates :name,            presence: true
  validates :executable_path, presence: true
  validates :status,          presence: true

  aasm column: :status, whiny_transitions: true do
    state :created, initial: true
    state :initialised
    state :running
    state :failed
    state :completed

    event :initialisation_complete      do transitions from: :created,                   to: :initialised     end
    event :run                          do transitions from: :initialised,               to: :running         end
    event :fail                         do transitions from: :running,                   to: :failed          end
    event :execute                      do transitions from: :running,                   to: :completed       end
    event :reset                        do transitions from: [:failed, :completed],      to: :initialised     end
  end

  def self.get_all
    result = {}
    tasks = Task.all

    result[:tasks] = tasks.collect do |task|
      entry = {}

      entry[:name]            = task.name
      entry[:executable_path] = task.executable_path
      entry[:start_time]      = task.start_time
      entry[:end_time]        = task.end_time
      entry[:status]          = task.status

      entry
    end

    result
  end

end
