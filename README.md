# README

This is a simple application that demonstrates how to integrate React frontend with a Rails backend, using Slack webhook integration to send notifications, and testing the backend using Minitest.
Rails with Rake, Slack notifiern and Minites

# Prerequisites

- Ruby 3.0.2 or later

- Rails 6.1.3 or later

- Node.js 14.0 or later

- NPM 6.14 or later

# BackEnd Installation

Clone the repository to your local machine

1. Install Ruby dependencies by running bundle install

2. Set up the database by running rails db:setup

3. Start the Rails server by running rails s

# FrontEnd Installation

1. Clone the repository or download the ZIP file and extract it.

https://github.com/HasithaEdiriweera/habit-app

2. Open a terminal and navigate to the project directory.

3. Run the command npm install to install the required dependencies.

4. Run the command for chakra-ui, npm i @chakra-ui/react @emotion/react @emotion/styled framer-motion

5. Run the command npm start to start the development server.

6. Open your web browser and go to http://localhost:3000.

# USAGE

The application has a simple user interface for creating and managing habits. You can create a new habit by clicking the "Add Habit" button, and delete/edit a habit by clicking the "Delete" or "Edit" icon in React frontend.

Each 2 hours of time notification is sent to the Slack channel via webhook integration.

# Configuration

- Fixed token configured as an environment variable 'AUTHENTICATION_TOKEN'

- Slack webhook integration

- To configure Slack webhook integration, follow these steps:

1. Create a new Slack app and enable incoming webhooks.

2. Create a new webhook for the app and note down the webhook URL.

3. Set the webhook URL as an environment variable named SLACK_WEBHOOK_URL.

- To run the slack notifications : rake notifications:send_random_notification

# Rails configuration

The Rails server runs on port 3001 by default. To change the port, set the PORT environment variable.

The Rails application uses a PostgreSQL database by default. To use a different database, update the database.yml file.

# Testing

The backend is tested using Minitest. To run the tests, use the following command:

rake test

# References

React (https://reactjs.org/)
Chakra UI (https://chakra-ui.com/)
Axios (https://axios-http.com/)
