# The workflow to edit documentation  {#workflow status=draft}

## Assumptions

## Workflow

#### Fork the repo on the Github site

#### Sign up on Circle

Activate the building on:

```
https://circleci.com/setup-project/gh/![username]/duckuments
```

Click "start building".

#### Checkout your fork locally

Add upstream reference:

```
$ git remote add upstream  git@github.com:duckietown/duckuments.git
```

See: [Github docs on forking](https://help.github.com/articles/syncing-a-fork/) 

#### Do your edits

#### Compile 

#### Commit

#### Merge master again

```
$ git fetch upstream
$ git merge upstream/master
```

#### Push and Make sure everything compiles

```
https://circleci.com/gh/![username]/duckuments
```

#### Make a pull request

Create a pull request from the command-line using [`hub`](#hub):

```
$ hub pull-request
```

See: [](#hub)

