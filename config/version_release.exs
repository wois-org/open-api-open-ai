import Config

replacements = [
  %{
    file: "CHANGELOG.md",
    type: :changelog,
    patterns: [
      %{search: "Unreleased", replace: "{{version}}", type: :unreleased},
      %{search: "...HEAD", replace: "...{{tag_name}}", global: false},
      %{search: "ReleaseDate", replace: "{{date}}"},
      %{
        search: "<!-- next-header -->",
        replace: "<!-- next-header -->\n\n## [Unreleased] - ReleaseDate",
        global: false
      },
      %{
        search: "<!-- next-url -->",
        replace:
          "<!-- next-url -->\n[Unreleased]: https://github.com/wois-org/open-api-open-ai/compare/{{tag_name}}...HEAD",
        global: false
      }
    ]
  }
]

config :version_release,
  tag_prefix: "v",
  changelog: %{
    creation: :manual,
    minor_patterns: ["added", "changed"],
    major_patterns: ["breaking", "release"],
    replacements: replacements,
    pre_release_replacements: replacements
  },
  commit_message: "[skip ci][version_release] {{message}}",
  dev_version: true
