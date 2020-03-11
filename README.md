<a  href="https://www.twilio.com">
<img  src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg"  alt="Twilio"  width="250"  />
</a>
 
# Twilio Sample App Template

[![Actions Status](https://github.com/TwilioDevEd/sample-template-rails/workflows/Rails%20CI/badge.svg)](https://github.com/TwilioDevEd/sample-template-rails/actions)

## About

This is a GitHub template for creating other [Twilio] sample/template apps. It contains a variety of features that should ideally be included in every Twilio sample app. You can use [GitHub's repository template](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) functionality to create a copy of this.

Implementations in other languages:

| .NET | Java | Python | PHP | NodeJS |
| :--- | :--- | :----- | :-- | :----- |
| TBD  | TBD  | TBD    | TBD | Done   |

### How it works

This is only a barebones Ruby on Rails application. Whenever, possible we should be using this. However, if you are using another framework like Sinatra that comes with their own standardized application structure, you should try to merge these by using the same `README` structure and test coverage, configuration etc. as this project.

<!--
**TODO: UML Diagram**

We can render UML diagrams using [Mermaid](https://mermaidjs.github.io/).


**TODO: Describe how it works**
-->

## Features

- [Ruby on rails](https://rubyonrails.org/) framework version 6
- Node.js for serving frontend assets with [webpack](https://webpack.js.org/)
- User interface to send SMS with bootstrap.
- Unit tests using [`Rspec`](https://rspec.info/)
- End to End UI testing using [Capybara](https://github.com/teamcapybara/capybara)
- [Automated CI testing using GitHub Actions](/.github/workflows/rails.yml)
- Linting and formatting using [Rubocop](https://docs.rubocop.org/en/stable/)
- Project specific environment variables using `.env` files and [`dotenv-rails`](https://github.com/bkeepers/dotenv) by comparing `.env.example` and `.env`.
- One click deploy buttons for Heroku, Glitch and now.sh
- Pre-commit hooks using [Overcommit](https://github.com/sds/overcommit) to ensure standardized code style and formatting.

## How to use it

1. Create a copy using [GitHub's repository template](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) functionality
2. Update the [`README.md`](README.md) and [`Gemfile`](Gemfile) with the respective values.
3. Build your app as necessary while making sure the tests pass.
4. Publish your app to GitHub

## Set up

### Requirements

- [Ruby](https://www.ruby-lang.org/en/) version **2.6.x**.
> **Important:** As of today, the latest stable version of Ruby (2.7.0) is not compatible with Rails 6 on Windows hosts. It works fine for Linux and MacOS users, but to preserve compatibility across all environments the version will be set to 2.6.5.
- [SQLite](https://www.sqlite.org/index.html) which is the default DBMS for Rails 6.
- [Bundler](https://bundler.io/)
- [Node.js](https://nodejs.org/) - Rails 6 now uses webpack to serve frontend assets, so it needs Node to install it.
- A Twilio account - [sign up](https://www.twilio.com/try-twilio)

### Twilio Account Settings

This application should give you a ready-made starting point for writing your
own appointment reminder application. Before we begin, we need to collect
all the config values we need to run the application:

| Config&nbsp;Value | Description                                                                                                                                                  |
| :---------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Account&nbsp;Sid  | Your primary Twilio account identifier - find this [in the Console](https://www.twilio.com/console).                                                         |
| Auth&nbsp;Token   | Used to authenticate - [just like the above, you'll find this here](https://www.twilio.com/console).                                                         |
| Phone&nbsp;number | A Twilio phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164) - you can [get one here](https://www.twilio.com/console/phone-numbers/incoming) |

### Local development

Before diving into the setup, it is **RECOMMENDED** to use Ruby with a version manager such as [`rbenv`](https://github.com/rbenv/rbenv) or [`asdf`](https://github.com/asdf-vm/asdf). This is specially important for MacOS users since OSX comes with a preinstalled Ruby version (usually an older version than the current) which may not be compatible with the new Rails 6 and it's generally better not to mess with system packages.

After the above requirements have been met:

1. Clone this repository and `cd` into it

  ```bash
  git clone git@github.com:twilio-labs/sample-template-rails.git
  cd sample-template-rails
  ```

2. Install gem dependencies

  ```bash
  bundle install
  ```

3. Install Node dependencies:

  ```bash
  npm install
  ```

4. Set your environment variables

  ```bash
  cp .env.example .env
  ```
  See [Twilio Account Settings](#twilio-account-settings) to locate the necessary environment variables.

5. Configure pre-commit hooks
```bash
bundle exec overcommit --install
```

6. Run the application

  ```bash
  bundle exec rails s
  ```
  Alternatively, you can use this command to start the server in development mode. It will reload whenever you change any files.
  ```bash
  bundle exec rails s -e development
  ```

7. Navigate to [http://localhost:3000](http://localhost:3000)

That's it!

### Tests

You can run the tests locally by typing:

```bash
bundle exec rspec
```

### Cloud deployment

Additionally to trying out this application locally, you can deploy it to a variety of host services. Here is a small selection of them.

Please be aware that some of these might charge you for the usage or might make the source code for this application visible to the public. When in doubt research the respective hosting service first.

| Service                           |                                                                                                                                                                                                                           |
| :-------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Heroku](https://www.heroku.com/) | [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/TwilioDevEd/sample-template-rails/tree/master)                                                                                                                                       |
| [Glitch](https://glitch.com)      | [![Remix on Glitch](https://cdn.glitch.com/2703baf2-b643-4da7-ab91-7ee2a2d00b5b%2Fremix-button.svg)](https://glitch.com/edit/#!/remix/clone-from-repo?REPO_URL=https://github.com/TwilioDevEd/sample-template-rails.git) |
| [Zeit](https://zeit.co/)          | [![Deploy with ZEIT Now](https://zeit.co/button)](https://zeit.co/new/project?template=https://github.com/TwilioDevEd/sample-template-rails/tree/master)                                                                 |

## Resources

- [GitHub's repository template](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) functionality

## Contributing

This template is open source and welcomes contributions. All contributions are subject to our [Code of Conduct](https://github.com/twilio-labs/.github/blob/master/CODE_OF_CONDUCT.md).

[Visit the project on GitHub](https://github.com/twilio-labs/sample-template-rails)

## License

[MIT](http://www.opensource.org/licenses/mit-license.html)

## Disclaimer

No warranty expressed or implied. Software is as is.

[twilio]: https://www.twilio.com
