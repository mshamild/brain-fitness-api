# Brain Fitness

[![Semaphore](https://semaphoreci.com/api/v1/projects/e308d8c6-23ba-4721-a929-9843545c84eb/504487/shields_badge.png)](https://semaphoreci.com/fs/brain-fitness-api)
[![Code Climate](https://codeclimate.com/github/fs/rails-base-api.png)](https://codeclimate.com/github/fs/brain-fitness-api)

## Dependencies

* `brew install postgres`
* `rbenv install 2.2.0`

## Quick Start

Clone this repo:

```
git clone git@github.com:fs/brain-fitness-api.git
cd brain-fitness-api
```

Run setup script

```
bin/setup
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Staging

http://brain-fitness-api-staging.herokuapp.com
