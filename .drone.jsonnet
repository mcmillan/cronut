local Pipeline(version) = {
  kind: "pipeline",
  name: "ruby-" + version,
  steps: [
    {
      name: "test",
      image: "ruby:" + version,
      commands: [
        "gem install bundler",
        "bundle install --jobs 4",
        "bundle exec rake rubocop",
        "bundle exec rake spec"
      ]
    }
  ]
};

[
  Pipeline("2.6"),
  Pipeline("2.5"),
  Pipeline("2.4"),
  Pipeline("2.3"),
]
