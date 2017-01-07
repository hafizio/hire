require "./hire/*"
require "commander"

cli = Commander::Command.new do |cmd|
  cmd.use = "hire"
  cmd.long = "project brief proposal"

  cmd.flags.add do |flag|
    flag.name = "rate"
    flag.short = "-r"
    flag.long = "--rate"
    flag.default = 30.00
    flag.description = "Expected hourly rate (MYR)."
  end

  cmd.flags.add do |flag|
    flag.name = "stack"
    flag.short = "-s"
    flag.long = "--stack"
    flag.default = 6
    flag.description = "[1] Backend, [2] Frontend, [3] Mobile. Add the numbers for each stack."
  end

  cmd.flags.add do |flag|
    flag.name = "duration"
    flag.short = "-d"
    flag.long = "--duration"
    flag.default = 60
    flag.description = "The minimum duration for a project (days)."
  end

  cmd.run do |options, arguments|
    options.float["rate"]    # => 30.00
    options.int["stack"]     # => 6
    options.int["duration"]  # => true
    arguments                # => Array(String)
    puts cmd.help            # => Render help screen
  end

  cmd.commands.add do |cmd|
    cmd.use = "submit <brief>"
    cmd.short = "Submit the brief about your project"
    cmd.long = cmd.short
    cmd.run do |options, arguments|
      arguments # => ["62719"]
    end
  end

end

Commander.run(cli, ARGV)
