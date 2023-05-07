require 'slack-notifier'

namespace :notifications do
  desc "Send a random Slack notification to improve habits"
  task :send_random_notification => :environment do
  # Generate a random message
  messages = [
    "Great job! Keep up the good work",
    "Looks like you're making progress!",
    "You got this! Keep working on your habits",
    "One step at a time, you can do it!"
  ]

  # Get all habits
  habits = Habbit.all

      # Loop indefinitely
    loop do
      # Wait for 5 minutes
      sleep(7200)

        # Get a random message
        message = messages.sample
        # Get a random habit and update its progress
        habit = habits.sample
        #   habit.progress += 1
        habit.save!

        # Send a Slack notification
        notifier = Slack::Notifier.new ENV["SLACK_WEBHOOK_URL"]

        # Create Slack notification template block
        template = {
            "blocks": [
                {
                    "type": "header",
                    "text": {
                        "type": "plain_text",
                        "text": "It's time to improve your habit..!",
                        "emoji": true
                    }
                },
                {
                    "type": "divider"
                },
                {
                    "type": "section",
                    "text": {
                        "type": "mrkdwn",
                        "text": "Habit: " + habit.name
                    }
                },
                {
                    "type": "section",
                    "text": {
                        "type": "mrkdwn",
                        "text": "Description: " + message
                    }
                },
                {
                    "type": "section",
                    "text": {
                        "type": "mrkdwn",
                        "text": "Don't forget to track your progress! :muscle:"
                    }
                },
                {
                    "type": "divider"
                }
            ]
        }
        notifier.ping template
    end
  end
end
