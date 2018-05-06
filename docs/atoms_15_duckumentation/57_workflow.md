# The workflow to edit documentation  {#workflow status=draft}

## Assumptions

* You have a Github account with username `![usernqme]`.

## Workflow

### Fork the repo on the Github site

For the `duckuments` repo on the Github site ([](#fork-duckuments)). 

<img src="fork-duckuments.png" style='width: 80%' figure-id="fig:fork-duckuments"/>

This will create a new repo on your account that is linked to the original one.

### Sign up on Circle

Sign up on the Circle CI service, at the link [circleci.com](http://circleci.com).

### Activate your build on Circle

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

####  Make sure everything compiles

Go to the URL:

```
https://circleci.com/gh/![username]/duckuments
```

to see the status of your build.

### Make a pull request

Create a pull request to the original

#### From the website

Github offers a nice interface to create a pull request.

#### From the command line

 from the command-line using [`hub`](#hub):

```
$ hub pull-request
```

See: [](#hub)

