AHEAD Start - Python
=====================

Python package boilerplate with pre-configured development environment.

## Usage

To get started, clone the repository from your git server to a directory
with a new name.  For Example:
```bash
git clone git@github.com:MyOrg/AheadStartPython.git NewProject
```

Next, go into your new project and initialize it with:
```bash
cd some_repo && chmod +x script/
script/start.sh         \
	-e "your@email.com" \
	-p "ProjectName"    \
	-d "a description"  \
	-k "some keywords"
```
The script will create a new git history, rename the the `project/`
directory, and overwrite fields in setup.py and a few other files
with your project information.

Once configured, calling `make` will run formatting, linting, optional
type checking, and lastly unit-tests.

While the boiler-plate tries to make starting a new project easier,
it's ultimate aim is subject new projects to CICD, and ensure that
new projects are semantically versioned.

The `Jenkinsfile` by default only has `Test` and `Release` steps.
When a branch is pushed to github, Jenkins will attempt to run
tests against the code.  When a build resulting from a merge into
the `master` branch exits successfully Jenkins will then call
`semantic-release` to handle the creation of a new release.

`semantic-release` is configured by .releaserc

## Contributing

To submit contributions, please adhere to the following guidelines.

 1. **Fork** the repository
 2. **Clone** the project from your forked repository to your machine
 3. **Commit** changes to your own branch adhering to [Conventional Commits][1]
 4. **Push** your changes on your branch to your forked repository.
 5. Submit a **Pull request** back to our repository for review.

**NOTE**: always merge from latest upstream before submitting pull requests.

## Versioning
[Semantic Versioning][2] is used to version this project.
Please consult the [releases][3]
page for a complete list of available versions.

## Authors

* [Patrick Delaney][4]

## License

This project is licensed under the terms of the Apache License 2.0.
please see [LICENSE](LICENSE.md) for more information.

[1]: https://www.conventionalcommits.org/en/v1.0.0-beta.4/#specification
[2]: https://www.semver.org/
[3]: https://github.com/AHEAD-MSP/ahead-start-python/releases
[4]: https://github.com/ptdel
