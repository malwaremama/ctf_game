# Run the WebServer

```
brew install direnv
```

- I use fish shell, [other shells available here](https://direnv.net/docs/hook.html)
- Add the following line at the end of the `~/.config/fish/config.fish` file:

```fish
eval (direnv hook fish)
```

- Change to the web_server directory and do terraform apply anytime.
  - It is intentionally separate from the rest of the infrastructure.
