# Feature

**hungthinhid-poc** is used for Hung Thinh ID application by using robotframework.


# Installation

- Install `Pycharm`
- Run `pip3 install -r requirements.txt` to install required dependencies
- Use requirements.txt to install all needed python libraries and Robot Framework.
Remember also install Chrome and ChromeDriver.

# Python Module
It is recommended to use and follow [pep8 style guide](https://www.python.org/dev/peps/pep-0008/) and install [pycodestyle](https://pypi.org/project/pycodestyle/) linter (uses pep8).

        pip3 install pycodestyle

You can set editor ([e.g. vscode](https://code.visualstudio.com/docs/python/linting)) to use this linter or run it from command line:

        pycodestyle some_file.py


If there is some linter warning/error that should be ignored use block comment before error/warning line, e.g.:

        # ignored import error
        from kpi_data_validation import validate_KPI_data

# Project Structure

- Common library file is located in `\resources\common_library` folder
- Test suites are located in `\test_cases\` folder
- Test cases are stored in `\${test_suite}` folder
- Keywords are located in `${test_suite}\implementation` folder
- Element location and files path are located in `${test_suite}\implementation\targets` folder
- Test data is located in `${test_suite}\test_data` folder
- Log files and reports of test execution are located in `${test_suite}\robotlogs` folder

## Running tests & modules

Need define --> task


## Gitlab CI pipeline and RF tags for E2E automation tests

Gitlab CI/CD is used in this project to execute E2E automation tests as scheduled. Test are executed against the latest development branch.
In [.gitlab-ci.yml](.gitlab-ci.yml) we use now our own docker base image for the CI jobs. If the test environment changes it's needed to build new docker image for CI jobs.

Gitlab CI pipeline for E2E tests contains multiple jobs/stages. Time limit for each job/stage is 3 hours.
* Nightly tests:
  * E2E automation tests that are executed every night/evening. Contains 4 stages/jobs based on RF tags
* Weekly tests:
  * E2E automation cases that are executed once a week (Saturday-Sunday night).

About tags:
* E2E cases re previously executed every night, so that's why those are tagged with 'Nightly' -tag. Now those are only executed once a week.
* Excluded From Nightly -tag is meant for test cases that takes more time to run, e.g. some raw data on demand -request cases.#htid-robotframework-poc
