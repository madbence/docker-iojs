# docker-iojs

Minimal docker base image for creating iojs containers.
Just make sure that you have:

- `.npmrc` file (use your own registry!)
- `package.json` that starts your app with `$ npm start`

Then just write your `Dockerfile`:

```
FROM lennon/iojs

# maybe expose ports or volumes, but nothing else really
```

Yep, that's it.

Then build your image:

```sh
$ docker build -t my-pretty-app .
```

The full image is around ~30MB,
and uses docker cache to prevent unnecessary `npm install`s.

```sh
$ docker run --rm my-pretty-app # tada!
```

## License

MIT
