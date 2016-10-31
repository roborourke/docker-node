# Generic Node Container

Node app generic container, to use it provide at least these 2 environment
variables on `docker run`:

```
GIT_REPO=user/repo
GIT_TOKEN=123456789
```

These 2 values are used to generate an authenticated `git pull` request. The
resulting URL looks like this:

```
https://${GIT_TOKEN}@github.com/${GIT_REPO}.git
```

You can generate the token at https://github.com/settings/tokens

Optionally you can pass in a `GIT_BRANCH` environment variable too. It defaults
to `master`.

On the topic of security the `CMD` uses the recommended `git init && git pull`
pattern so that no tokens are written to the disk at any point.

Don't forget to provide any other environment variables your app needs at run
time!
