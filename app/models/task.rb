class Task < ActiveRecord::Base
  include AASM

  attr_accessible :name, :executable_path, :start_time, :end_time, :status

  validates :name,            presence: true
  validates :executable_path, presence: true
  validates :status,          presence: true
  validates :start_time,      presence: true

  aasm column: :status, whiny_transitions: true do
    state :created, initial: true
    state :initialised
    state :running
    state :failed
    state :completed

    event :initialisation_complete      do transitions from: :created,                             to: :initialised     end
    event :run                          do transitions from: :initialised,                         to: :running         end
    event :fail                         do transitions from: :running,                             to: :failed          end
    event :execute                      do transitions from: :running,                             to: :completed       end
    event :reset                        do transitions from: [:failed, :completed, :running],      to: :initialised     end
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

  def run_task!
    self.run!
    5.times do |i|
      sleep 1.9
      puts "Runing: #{self.name} with sleep 1.9"
    end
    self.execute!

    self.end_time = Time.now
    self.save
  end

  def schedule!
    delay(run_at: self.start_time).run_task!
  end

  def self.create_task(params)
    task = Task.new

    task.name            = params[:name]
    task.executable_path = params[:path]
    task.start_time      = params[:run_at].to_datetime
    task.initialisation_complete!

    task
  end

  def self.create_or_schedual_task(params)
    task = Task.where(name: params[:name], executable_path: params[:path]).first
    if task.blank?
      task = create_task(params)
    else
      task.reset! if task.may_reset?
    end
    task.schedule!

    task
  end

end
