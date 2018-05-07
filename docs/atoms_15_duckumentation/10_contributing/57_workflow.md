# Workflow to edit documentation  {#duckumentation-workflow status=ready}

This section describes the workflow to edit the documentation collaboratively.

We make the following assumptions:

* Every writer has a Github account with username `![username]`.
* Every writer will *fork* the `duckuments` repo to their Github account.
* All contributions are pull requests.
* [Optional] Every writer will sign up on Circle CI. This will make it easier to check whether there are problems to be fixed.

## Workflow

### Fork the `duckuments` repo on the Github site

For the `duckuments` repo on the Github site ([](#fork-duckuments)).

<img src="fork-duckuments.png" style='width: 80%' figure-id="fig:fork-duckuments"/>

This will create a new repo on your account that is linked to the original one.

### [optional] Sign up on Circle

Sign up on the Circle CI service, at the link [circleci.com](http://circleci.com).

### [optional] Activate your build on Circle

Activate the building at the link:

```
https://circleci.com/setup-project/gh/![username]/duckuments
```

where `![username]` is your Github username.

Click "start building".

### Checkout your fork locally

Check out the forked repository as you would do normally.

### Do your edits

Do your edits on your

### Compile

Compile using:

```
$ make all
```

You can also compile a single book using:

```
$ make book-![book name]
```

Type TAB after `book-` to see the list of books.

### Commit and push

Commit and push as you would do normally.

####  [optional] Make sure everything compiles on Circle

Go to the URL:

```
https://circleci.com/gh/![username]/duckuments
```

to see the status of your build.

You can also preview the results by clicking the "artifacts" tab and selecting `index.html` from the list.

<img src='ci-artifacts.png' style='width:90%' figure-id="fig:ci-artifacts"/>

### Make a pull request

Create a pull request to the original repository.

#### Option 1: Use the Github website

Github offers a nice interface to create a pull request.

#### Option 2: Use the command-line program `hub`

You can create a pull request from the command-line using [`hub`](#hub):

```
$ hub pull-request
```

See: [](#hub)
