require 'thread'

module Actors
  class Actor
    def self.run
      Thread.new do
        begin
          loop do
            instance_eval(&@block)
          end
        rescue Exception => e
          puts e
        end
      end
    end

    def self.add_block(block)
      @block = block
    end

    def self.push(value)
      queue << value
    end

    def self.queue
      @queue ||= Queue.new
    end

    def self.pop
      queue.pop
    end
  end

  def self.actor(name, &block)
    class_ = Class.new(Actor)
    class_.add_block(block)
    const_set(name, class_)
  end

  def self.run(actors)
    threads = actors.map { |actor| actor.run }
    threads.each { |thread| thread.join }
  end
end
