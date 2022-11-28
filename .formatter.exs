[
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{heex,ex,exs}"],
  import_deps: [:ecto, :phoenix],
  subdirectories: ["priv/*/migrations"]
]
